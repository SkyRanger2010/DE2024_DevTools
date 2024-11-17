#!/bin/bash
COUNT=1
SUM=$((0))
MOD_EVAL=$((10**9 +7))
for num in $(cat input.txt) ; do
	if [ $COUNT -eq 1 ] ; then
		X=$num
		COUNT=$(( COUNT + 1 ))
	else
		POWER=$(( COUNT - 2 ))
		STEP_SUM=$((num*X**POWER ))
		MOD_STEP_SUM=$((STEP_SUM%MOD_EVAL))
		SUM=$(( (SUM+MOD_STEP_SUM) % MOD_EVAL ))
		COUNT=$(( COUNT + 1 ))
	fi
done
RES=$((SUM%MOD_EVAL))
echo $RES  > output.txt
