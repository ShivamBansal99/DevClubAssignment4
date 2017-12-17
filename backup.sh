#! /bin/sh
copy()
{
	cd $1
	for i in *
	do
		deed=`ls $2 | grep ^$i$`
		if [ -f ${1}/${i} ]
		then
			if [ -z "$deed" ]
			then
				if [ -z "$3" ]
				then
					echo $i
				else
					echo ${3}/${i}
				fi
			fi
		else
			if [ -z "$deed" ]
			then
				mkdir ${2}/${i}
			fi
			check=`ls ${1}/${i}`
			echo check $check
			if [ -n "$check" ]
			then
				echo not empty ${1}/${i}
				copy ${1}/${i} ${2}/${i} ${3}/${i}
			fi
		fi
	done
}
echo "Files copied from $1 to $2 are"
copy $1 $2
echo "Files copied from $2 to $1 are"
copy $2 $1
