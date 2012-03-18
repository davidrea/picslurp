#!/bin/bash

### Set up built-in configs ###

filetypes=(
	"jpg"
	"cr2"
)

targets=(
	"/media/EOS_DIGITAL"
)

target_count=${#targets[@]}
type_count=${#filetypes[@]}

### Parse command-line options ###



### Find and transfer images ###

for((i=0;i<${target_count};i++))
do
	if [ ! -d ${targets[$i]} ]; then
		echo "Could not find: ${targets[$i]}"
		continue
	fi
	for((j=0;j<${type_count};j++))
	do
		target="${targets[$i]}"
		type="${filetypes[$j]}"
		date=`date +"%Y_%m_%d"`
		destination=`pwd`/import_$date
		if [ ! -d $destination ]; then
			mkdir $destination
			echo "Created directory: $destination"
		fi
		find $target -iname "*.${type}" -exec mv -vi '{}' $destination \;
	done
done
