#!/bin/sh
#
# ipcam stop all service 
# use in www server when firmware upgrade
#

echo "stop plcam stream server"
killall plcamsvr
