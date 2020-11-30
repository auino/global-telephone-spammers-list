#!/bin/bash

if [ $# -ne 3 ]; then
	echo "Usage: $0 <number> <details>"
	exit 0
fi

N="$1"
D="$2"

M=`echo $N|md5`
C=`cat list.csv|grep "$M"|wc -l|awk '{print $1}'`
if [ $C -eq 0 ]; then
	echo "$D,$M" >> list.csv
	echo "Added!"
else
	echo "Already present with md5 equal to '$M'"
fi
