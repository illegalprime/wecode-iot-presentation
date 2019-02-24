#!/bin/sh

die() {
	echo $@
	exit 1
}

showUsage() {
	die "$0 {start|stop|restart|status} [prefix]"
}

start() {
	echo start services, ...
	$prefix/etc/rc.d/init.d/vcd.sh start $prefix
	$prefix/etc/rc.d/init.d/acd.sh start $prefix
	[ -x $prefix/etc/rc.d/init.d/ptd.sh ] &&
		$prefix/etc/rc.d/init.d/ptd.sh start $prefix
	$prefix/etc/rc.d/init.d/scheduled.sh start $prefix
	$prefix/etc/rc.d/init.d/eventd.sh start $prefix
	$prefix/etc/rc.d/init.d/recorderd.sh start $prefix
	$prefix/etc/rc.d/init.d/snapshotd.sh start $prefix
	$prefix/etc/rc.d/init.d/motiond.sh start $prefix
	$prefix/etc/rc.d/init.d/rtpd.sh start $prefix
	$prefix/etc/rc.d/init.d/rtspd.sh start $prefix
}

status() {
	echo status of services, ...
	$prefix/etc/rc.d/init.d/vcd.sh status $prefix
	$prefix/etc/rc.d/init.d/acd.sh status $prefix
	[ -x $prefix/etc/rc.d/init.d/ptd.sh ] &&
		$prefix/etc/rc.d/init.d/ptd.sh status $prefix
	$prefix/etc/rc.d/init.d/scheduled.sh status $prefix
	$prefix/etc/rc.d/init.d/eventd.sh status $prefix
	$prefix/etc/rc.d/init.d/recorderd.sh status $prefix
	$prefix/etc/rc.d/init.d/snapshotd.sh status $prefix
	$prefix/etc/rc.d/init.d/motiond.sh status $prefix
	$prefix/etc/rc.d/init.d/rtpd.sh status $prefix
	$prefix/etc/rc.d/init.d/rtspd.sh status $prefix
}

stop() {
	echo stop services, ...
	$prefix/etc/rc.d/init.d/rtspd.sh stop $prefix
	$prefix/etc/rc.d/init.d/rtpd.sh stop $prefix
	$prefix/etc/rc.d/init.d/motiond.sh stop $prefix
	$prefix/etc/rc.d/init.d/snapshotd.sh stop $prefix
	$prefix/etc/rc.d/init.d/recorderd.sh stop $prefix
	$prefix/etc/rc.d/init.d/eventd.sh stop $prefix
	$prefix/etc/rc.d/init.d/scheduled.sh stop $prefix
	[ -x $prefix/etc/rc.d/init.d/ptd.sh ] &&
		$prefix/etc/rc.d/init.d/ptd.sh stop $prefix
	$prefix/etc/rc.d/init.d/acd.sh stop $prefix
	$prefix/etc/rc.d/init.d/vcd.sh stop $prefix
}

action=$1
prefix=$2
end=$3

[ "$end" = "" ] && [ "$action" != "" ] || showUsage
[ "$prefix" = "" ] || [ -d "$prefix" ] || die "$prefix is not a valid directory"

case $action in
	start)
		start
	;;
	stop)
		# stop may call return, instead of exit
		stop || exit 1
	;;
	restart)
		stop
		start
	;;
	status)
		status
	;;
	*)
		showUsage
	;;
esac

exit 0
