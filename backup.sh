#! /bin/sh
#recursive function to copy directory $1 is dir from which copy is done
#$2 is where to copy
#$3 is relative path of file being copied
copy()
{
	cd $1
	for i in * #iterates through all files/dir's in the directory
	do
		deed=`ls $2 | grep ^$i$` #checks if file/dir is there in second dir
		if [ -f ${1}/${i} ] #checks if the current file/dir is file or not
		then
			if [ -z "$deed" ] #if file is not there in second one
			then
				if [ -z "$3" ] 
				then
					echo $i 
				else
					echo ${3}/${i}
				fi
				cp ${1}/${i} $2
			fi
		else
			if [ -z "$deed" ] #if dir is not there in second one
			then
				mkdir ${2}/${i}
			fi
			check=`ls ${1}/${i}` #checks if dir contains files or not
			if [ -n "$check" ] #copy if files are there
			then
				if [ -z "$3" ]
				then
					copy ${1}/${i} ${2}/${i} ${i}
				else
					copy ${1}/${i} ${2}/${i} ${3}/${i}
				fi
			fi
		fi
	done
}
echo "Files copied from $1 to $2 are"
checking=`ls $1 | wc -l`
if [ $checking -ne 0 ]
then
copy $1 $2
fi
echo "Files copied from $2 to $1 are"
checking=`ls $2 | wc -l`
if [ $checking -ne 0 ]
then
copy $2 $1
fi
