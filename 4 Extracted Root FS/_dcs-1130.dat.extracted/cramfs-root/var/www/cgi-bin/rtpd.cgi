#!/bin/sh

daemon=rtpd

script=/etc/init.d/$daemon.sh
conf=/etc/$daemon.conf

configure() {
	cat > $conf << EOM
skips="$skips"
quality="$quality"
auto="$auto"
EOM
	/etc/init.d/update_config save
	echo 
	echo "+--------------- New Setting ---------------+"
	cat $conf
	echo "+-------------------------------------------+"
}

die () {
	echo $@
	exit 1
}

echo -e "\
Expires: Mon, 26 Jul 1997 05:00:00 GMT\n\
Pragma: no-cache\n\
Cache-Control: no-cache, must-revalidate\n\
Content-type: text/plain\n\n"

echo "$QUERY_STRING" | grep -vq ' ' || die "query string cannot contain spaces."
. $conf > /dev/null 2> /dev/null
eval "$(echo $QUERY_STRING | sed -e 's/&/ /g')"

case $action in
	start)
		$script start
	;;
	stop)
		$script stop
	;;
	restart)
		$script restart
	;;
	status)
		$script status
	;;
	get)
		cat $conf
	;;
	set)
		configure
		$script restart
	;;
	*)
		echo "Usage: $daemon.cgi?action=[start|stop|restart|status|get|set]&..."
		exit 1
	;;
esac

exit 0
