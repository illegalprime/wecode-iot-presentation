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

# Be called first.
onGetSetting() {
    eval $(dumpHTTPAccountKeys | tdb get HTTPAccount)
    status="200"
}

# Be called when HTTP GET/POST has parameters.
onUpdateSetting() {
    if [ "$name" ]; then
        u_name="$name"
    fi
    status="200"
}

hasUserName() {
    let n=1
    while [ $n -le 20 ]; do
        eval tmp=$"User${n}_ss"
        if [ "$tmp" != $u_name ]; then
            let n++
        else
            eval tpass=$"Password${n}_ss"
            pair 'password' $(base64 en $tpass)
            pair 'group' 'Users'
            break
        fi
    done
}

# To response something.
onDumpInf() {
    if [ "$u_name" ]; then
        if [ $u_name = $_AdminUser_ss ]; then
            pair 'password' $(base64 en $AdminPasswd_ss)
            pair 'group' 'Administrator'
        else
            hasUserName
        fi
    else
        let n=1
        let num=1
        pair "$_AdminUser_ss" 'Administrator'
        while [ $n -le 20 ]; do
            eval tmp=$"User${n}_ss"
            if [ "$tmp" ]; then
                let num++
                pair "$tmp" 'Users'
            fi
            let n++
        done
        pair 'users' "$num"
    fi

    infOK
}

# used in cgi-bin , use...
. ../infMain.sh

# vi:et sw=4 sts=4
