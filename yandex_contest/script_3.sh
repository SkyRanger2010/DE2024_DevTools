#!/bin/bash
COUNT=1
SUM=$((0))
MOD_EVAL=$((10**9+7))
for num in $(cat input.txt) ; do
	if [ $COUNT -eq 1 ] ; then
		X=$num
		COUNT=$(( COUNT + 1 ))
	else
		if [ $COUNT -eq 2 ] ; then
			SUM=$num
			COUNT=$(( COUNT + 1 ))
		else
			step_num=1
			power=$(( COUNT - 2 ))
			for ((i=1;i<=power;i++)); do
				step_num=$(( (step_num*X)%MOD_EVAL ))
			done
			STEP_SUM=$(( (num*step_num)%MOD_EVAL ))
			SUM=$(( (SUM+STEP_SUM)))
			COUNT=$(( COUNT + 1 ))
		fi
	fi
done
echo $((SUM%MOD_EVAL)) > output.txt  
