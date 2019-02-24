#!/bin/sh

catFiles() {
	[ "$1" != "" ] || return 0
	[ "$1" != "/proc" ] || return 0
	[ -d "$1" ] || return 0
	if ! ls $1 > /dev/null; then
		exitCode=1
		return 0
	fi

	for i in $(ls $1); do
		[ "$i" = "" ] && continue
		[ -d $1/$i ] && catFiles $1/$i
	done
	for i in $(ls $1); do
		[ "$i" = "" ] && continue
		if [ -f $1/$i ]; then
			if ! cat $1/$i > /dev/null; then
				exitCode=1
			fi
		fi
	done
}

dir=$1
[ "$dir" != "" ] || dir=$(pwd)

exitCode=0
catFiles $dir
exit $exitCode
