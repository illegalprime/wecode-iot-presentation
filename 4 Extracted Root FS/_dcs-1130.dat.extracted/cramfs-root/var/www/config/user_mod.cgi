#!/bin/sh
dumpHTTPAccountKeys() {
    echo "_AdminUser_ss AdminPasswd_ss User1_ss Password1_ss \
User2_ss Password2_ss User3_ss Password3_ss User4_ss Password4_ss \
User5_ss Password5_ss User6_ss Password6_ss User7_ss Password7_ss \
User8_ss Password8_ss User9_ss Password9_ss User10_ss Password10_ss \
User11_ss Password11_ss User12_ss Password12_ss User13_ss Password13_ss \
User14_ss Password14_ss User15_ss Password15_ss User16_ss Password16_ss \
User17_ss Password17_ss User18_ss Password18_ss User19_ss Password19_ss \
User20_ss Password20_ss"
}

saveNamePass() {
     echo "$1=$2
$3=$4" | tdb set HTTPAccount
}

onGetSetting() {
    eval $(dumpHTTPAccountKeys | tdb get HTTPAccount)
	echo $_AdminUser_ss
	echo $AdminPasswd_ss
	echo $User1_ss
	echo $Password1_ss
    update=0
}

onUpdateSetting() {
    if [ "$name" -a "$password" ]; then
        if [ $name = $_AdminUser_ss ]; then
            pass=$(base64 de $password)
		echo $pass
            echo "AdminPasswd_ss=$pass" | tdb set HTTPAccount
            update=2
            status=200
            return
        fi
        let n=1
        while [ $n -le 20 ]; do
            eval tmp=$"User${n}_ss"
            if [ "$tmp" = $name ]; then
                pass=$(base64 de $password)
                echo "Password${n}_ss=$pass" | tdb set HTTPAccount
                update=1
                break
            elif [ "$tmp" != $name ]; then
                let n++
            fi
        done
        if [ $update -eq 1 ]; then
            status=200
            return
        fi
        # no user name found in the db, so add one record.
        let n=1
        while [ $n -le 20 ]; do
            eval tmp=$"User${n}_ss"
            if [ -z "$tmp" ]; then
                pass=$(base64 de $password)
                saveNamePass "User${n}_ss" $name "Password${n}_ss" $pass
                update=1
                break
            else
                let n++
            fi
        done
    fi
    [ $update -eq 1 ] && status=200 || status=400
}

onDumpInf() {
    [ -z "$name" ] && status=400
    
    if [ $status -eq 200 ]; then
        if [ $update -eq 1 ]; then
            pair 'name' $name
            pair 'password' $password
            pair 'group' "Users"
        elif [ $update -eq 2 ]; then
            pair 'name' $name
            pair 'password' $password
            pair 'group' "Administrator"
        fi
        infOK
    else
        infFail "$status"
    fi
    if [ $status -eq 200 ]; then
        echo "/etc/rc.d/init.d/lighttpd.sh restart"
        /etc/rc.d/init.d/lighttpd.sh restart
    fi
}

# used in cgi-bin , use...
. ../infMain.sh

# vi:et sw=4 sts=4
