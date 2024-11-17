#!/bin/bash
COUNT=1
SUM=$((0))
for num in $(cat input.txt) ; do
	if [ $COUNT -eq 1 ] ; then
		X=$num
		COUNT=$(( COUNT + 1 ))
	else
		POWER=$(( COUNT - 2 ))
		STEP_SUM=$(( X**POWER ))
		SUM=$(( SUM+num*STEP_SUM ))
		COUNT=$(( COUNT + 1 ))
	fi
done
RES=$((SUM%(10^9+7)))
echo $RES  > output.txt
