#!/bin/sh

showUsage() {
	echo $0 host [prefix] [mntPoint]
	exit 1
}

prefix=/prefix/dcs5221
mntPoint=/opt

host=$1
[ "$2" != "" ] && prefix=$2
[ "$3" != "" ] && mntPoint=$3

[ "$host" != "" ] || showUsage

mount -o nolock $host:$prefix $mntPoint
