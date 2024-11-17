#!/bin/bash
cnt=1
sum=$((0))
mod=$((10**9+7))
for num in $(cat input.txt) ; do
	if [ $cnt -eq 1 ] ; then
		x=$num
		cnt=$(( cnt + 1 ))
	else
		
		power=$(( cnt - 2 ))
		sum=$(awk "BEGIN {print ($sum+$num*$x^$power)%$mod}")
		cnt=$(( cnt + 1 ))
	fi
done
echo $sum  > output.txt
