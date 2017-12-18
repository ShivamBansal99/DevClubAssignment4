#! /bin/sh
#Checks if foldar can open
check=`ls $1 2>/dev/null`
if [ "$?" != "0" ]
then
	exit 1;
fi
#For all files $2 is of zero length
if [ -z "$2" ]
then
	files=`ls -al $1 | grep ^- | wc -l`#as all files have '-'rwxrwxrwx format and dir's have drwxrwxrwx
	if [ "$?" = "0" ]
	then
		echo $files
	else
		exit 1;
	fi
else
	c=\\$2 # \ is added as period(.) in $2 may represent 'any character' in grep
	files=`ls -al $1 | grep -o ^-.*${c}$ |  wc -l`#files that have $c at end
	if [ "$?" = "0" ]
	then
		echo $files
	else
		exit 1;
	fi
fi
