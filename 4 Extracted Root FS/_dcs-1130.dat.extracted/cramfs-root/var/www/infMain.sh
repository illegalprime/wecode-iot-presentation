infFile=/tmp/cgi$$.inf

pair() {
	echo -e "$1=$2\r" >> $infFile
}

sizeof() {
	if [ -f "$1" ]; then
		ls -l $1 | cut -b 38-42
	else
		echo 0
	fi
}

infOK() {
	echo -ne "\
Expires: Mon, 26 Jul 1997 05:00:00 GMT\r
Last-Modified: $(/bin/date -u -R)\r
Cache-Control: no-cache, no-store, must-revalidate\r
Pragma: no-cache\r
Content-Type: text/plain\r
Content-Length: $(sizeof $infFile)\r
Connection: close\r
\r
"
	[ -f "$infFile" ] && cat $infFile
}

infFail() {
	echo -ne "\
Status: $1\r
Content-Type: text/plain\r
Content-Length: 0\r
\r
"
}

debuglog() {
	echo $@ >> /tmp/debuglog
}

doIt() {
	onGetSetting
	
	__dirty="false"
	if [ "$REQUEST_METHOD" = "POST" ]; then 
		if [ "$CONTENT_TYPE" = "application/x-www-form-urlencoded" ]; then
			read PARAMETERS
			if [ "$PARAMETERS" != "" ]; then 
				eval $(urlDecode "$PARAMETERS") || exit 1
				__dirty="true"
			fi
		else 
			eval $(formData "$CONTENT_TYPE") || exit 1
			__dirty="true"
		fi
	elif [ "$REQUEST_METHOD" = "GET" ]; then
		if [ "$QUERY_STRING" != "" ]; then 
			eval $(urlDecode "$QUERY_STRING") || exit 1
			__dirty="true"
		fi
	fi

	if [ "$__dirty" = "true" ]; then
		onUpdateSetting
		# cleanup
		[ -f "$UPLOAD" ] && rm -f "$UPLOAD"
	fi

	onDumpInf
	[ -f "$infFile" ] && rm -f $infFile
}

checkRange() {
        [ -z "$1" ] && return 1
        if [ "$1" -ge "$2" -a "$1" -le "$3" ]; then
                return 0
        else
                return 1
        fi
}

checkStringLen() {
        # Empty string doesn't need to check the length.
        [ "$1" ] || return 0
        [ "$2" ] || return 0
        [ "$(echo -n "$1" | wc -c)" -le "$2" ] || return 1
	return 0
}

checkVal1orVal2() {
        [ -z "$1" ] && return 1
        if [ "$1" = "$2" -o "$1" = "$3" ]; then
                return 0
        else
                return 1
        fi
}

IsStrInStringList() {
        let n=1
        Str=$1
        SeparateChar=$2
        FindStr=$3
        SeparateStr=$FindStr
        while [ "$SeparateStr" ]; do
                SeparateStr=$(echo $Str | cut -d$SeparateChar -f${n})
                if [ "$SeparateStr" = "$FindStr" ]; then
                        return 0
                else
                        if [ "$SeparateStr" ]; then
                                let n++
                        fi
                fi
        done
        return 1
}

getStringListNum() {
        Str=$1
        [ "$Str" ] || return 0
        SeparateChar=$2
        [ "$SeparateChar" ] || return 0
        let n=1
        SeparateStr=$SeparateChar
        while [ "$SeparateStr" ]; do
                SeparateStr=$(echo $Str | cut -d$SeparateChar -f${n})
                if [ "$SeparateStr" ]; then
                        if [ "$SeparateStr" = "$Str" ]; then
                                SeparateStr=""
                        else
                                let n++
                        fi
                fi
        done
	if [ $n -gt 1 ]; then
        	n=$(expr $n - 1)
	fi
        return $n
}

doIt
