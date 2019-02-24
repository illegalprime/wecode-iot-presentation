#!/bin/sh

onGetSetting() {
    status=200
    eval $(pibinfo Peripheral)
}

onUpdateSetting() {
    [ "$FrontLED" -eq 1 ] || return
    if [ "$led" ]; then
        if [ "$led" = "on" ]; then
            light led on
        else
            light led off
        fi
    fi
}

onDumpInf() {
    if [ "$FrontLED" -eq 1 ]; then
        pair 'led' $(sniff led)
    fi
    infOK
}

. ../infMain.sh

# vi: et sw=4 sts=4
