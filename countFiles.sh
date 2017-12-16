#! /bin/sh
check=`ls $1 2>/dev/null`
if [ "$?" != "0" ]
then
	exit 1;
fi
if [ -z "$2" ]
then
	files=`ls -al $1 | grep ^- | wc -l`
	if [ "$?" = "0" ]
	then
		echo $files
	else
		exit 1;
	fi
else
	files=`ls -a $1 | grep -o ^..*${2}$ |  wc -l`
	if [ "$?" = "0" ]
	then
		echo $files
	else
		exit 1;
	fi
fi
