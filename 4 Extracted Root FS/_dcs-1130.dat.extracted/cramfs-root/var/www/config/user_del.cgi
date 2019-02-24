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

setTDB() {
    empty=""
    echo "$1=$empty
$2=$empty" | tdb set HTTPAccount
}

onGetSetting() {
    eval $(dumpHTTPAccountKeys | tdb get HTTPAccount)
}

onUpdateSetting() {
    deleted=""
    if [ "$name" ]; then
	set $(echo $name | sed 's/,/ /g')
        for t in $@; do
            let n=1
            while [ $n -le 20 ]; do
                eval tmp=$"User${n}_ss"
                if [ "$tmp" != $t ]; then
                    let n++
                else
                    eval pass=$"Password${n}_ss"
                    setTDB "User${n}_ss" "Password${n}_ss"
                    if [ "$deleted" ]; then
                        deleted="$deleted,$t"
                    else
                        deleted="$t"
                    fi
                    break
                fi
            done
        done

        [ "$deleted" ] && status=200 || status=400
    fi
}

onDumpInf() {
    [ -z "$name" ] && status=400
    if [ $status -eq 200 ]; then
        pair 'name' "$deleted"
        infOK
    else
        infFail $status
    fi
}

# used in cgi-bin , use...
. ../infMain.sh

# vi:et sw=4 sts=4
