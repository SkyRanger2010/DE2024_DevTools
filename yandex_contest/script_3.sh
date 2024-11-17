#!/bin/bash

COUNT=1
SUM=0
for num in $(cat input.txt) ; do
	if [ $COUNT -eq 1 ] ; then
		X=$num
		COUNT=$(( COUNT + 1 ))
	else
		POWER=$(( COUNT - 2)) 
		SUM=$(( SUM + $num * $(echo "$X^$POWER" | bc) ))
		COUNT=$(( COUNT + 1 ))
	fi
done
echo "$SUM%(10^9+7)" | bc > output.txt
