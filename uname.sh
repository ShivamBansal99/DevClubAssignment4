#! /bin/sh
if [ -z "$1" ]
then
	exit 1;
fi
if [ -z "$2" ]
then
	exit 1;
fi

ifs_old="$IFS"
IFS=:
search=`cat $1 | grep ^$2: | cut -d: -f5 `
IFS="$ifs_old"
if [ -z "$search" ]
then
	echo "Invalid Username"
else
	echo $search
fi
