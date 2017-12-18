#! /bin/sh
if [ -z "$1" ]
then
	exit 1;
fi
if [ -z "$2" ]
then
	exit 1;
fi
tester=`echo $1 | grep ^..*\.txt$ | wc -l`
if [ $tester -ne 1 ]
then
	exit 1
fi
tmp=`cat $1 2>/dev/null`
if [ $? -ne 0 ]
then
	exit 1
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
