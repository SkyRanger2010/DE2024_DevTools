#!/bin/bash
cnt=1
sum=$((0))
mod=$((10**9+7))
prev=$((0))
for num in $(cat input.txt) ; do
	if [ $cnt -eq 1 ] ; then
		x=$num
		prev=$((x%mod))
		cnt=$(( cnt + 1 ))
	else
		if [ $cnt -eq 2 ] ; then
			sum=$((num%mod))
			cnt=$(( cnt +1 ))
		else
			prev=$((prev*x%mod))
			sum=$(( (sum+num*prev)%mod ))
			cnt=$(( cnt + 1 ))
		fi
	fi
done
echo $sum  > output.txt
