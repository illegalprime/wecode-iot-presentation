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

	onDumpXml
}

doIt
