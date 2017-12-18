#! /bin/bash
i=1
result=0
while :
do
	file=`cat $1 | cut -d$'\n' -f$i` #cuts the file and keeps ith row
	if [ -z "$file" ]  #if ith row is empty breaks through loop
	then
		break
	fi
	let i+=1
	arith=`echo $file | cut -d' ' -f2` #cuts and keeps second part which is +-*/ only
	num=`echo $file | cut -d' ' -f1` #keeps number
	case $arith in
		+) let result+=${num} 
		;;
		-) let result-=$num
		;;
		/) let result/=${num}
		;;
		*) let result\*=$num #this case refers to arith being other than +-/
	esac
done
echo $result
