#! /bin/bash
i=1
result=0
while :
do
	file=`cat $1 | cut -d$'\n' -f$i`
	if [ -z "$file" ]
	then
		break
	fi
	let i+=1
	arith=`echo $file | cut -d' ' -f2`
	num=`echo $file | cut -d' ' -f1`
	case $arith in
		+) let result+=${num}
		;;
		-) let result-=$num
		;;
		/) let result/=${num}
		;;
		*) let result\*=$num
	esac
done
echo $result
