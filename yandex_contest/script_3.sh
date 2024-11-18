#!/bin/bash
cnt=1
sum=$((0))
mod=$((10**9+7))
prev=$((0))
while IFS= read -r num ; do
	if [ $cnt -eq 1 ] ; then
		x=$num
		cnt=$(( cnt + 1 ))
	else
		if [ $cnt -eq 2 ] ; then
			sum=$((num%mod))
			cnt=$(( cnt + 1 ))
		else
			if [ $cnt -eq 3 ] ; then
				prev=$((x%mod))
			else
				prev=$((prev*x%mod))
			fi
			sum=$(( (sum+num*prev)%mod ))
			cnt=$(( cnt + 1 ))
		fi
	fi
done < input.txt
echo $sum  > output.txt
