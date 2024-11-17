#!/bin/bash
COUNT=1
SUM=$((0))
MOD_EVAL=$((10**9+7))
for num in $(cat input.txt) ; do
	if [ $COUNT -eq 1 ] ; then
		X=$num
		COUNT=$(( COUNT + 1 ))
	else
		
		power=$(( COUNT - 2 ))
		STEP_SUM=$(awk "BEGIN {print $num*$X^$power%$MOD_EVAL }")
		SUM=$(( (SUM+STEP_SUM)%MOD_EVAL ))
		COUNT=$(( COUNT + 1 ))
	fi
done
echo $((SUM%MOD_EVAL))  > output.txt
