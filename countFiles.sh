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
	c=\\$2
	files=`ls -al $1 | grep -o ^-.*${c}$ |  wc -l`
	if [ "$?" = "0" ]
	then
		echo $files
	else
		exit 1;
	fi
fi
