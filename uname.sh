#! /bin/sh
if [ -z "$1" ]#no argument
then
	exit 1;
fi
if [ -z "$2" ]#no second argument
then
	exit 1;
fi
tester=`echo $1 | grep ^..*\.txt$ | wc -l`
if [ $tester -ne 1 ]#checks for correct format
then
	exit 1
fi
tmp=`cat $1 2>/dev/null`
if [ $? -ne 0 ]#checks if file exists and can open
then
	exit 1
fi
ifs_old="$IFS"
IFS=:
search=`cat $1 | grep ^$2: | cut -d: -f5 ` #finds line that starts with $2 and cuts with : and keeps fifth piece
IFS="$ifs_old"
if [ -z "$search" ] #not found condition
then
	echo "Invalid Username"
else
	echo $search
fi
