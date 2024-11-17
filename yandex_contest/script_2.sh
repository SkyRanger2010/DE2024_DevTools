#!/bin/bash

TYPE=$(tail -n 1 input.txt)

case "$TYPE" in
	date )
		sed '1d; $d' input.txt | LC_ALL=C sort -nk5 -nk4 -nk3 -k2 -k1 | sed 's/ /./g3' | sed 's/ /./g4' > output.txt
		;;
	name )
		sed '1d; $d' input.txt | LC_ALL=C sort -k2 -k1 | sed 's/ /./g3' | sed 's/ /./g4' > output.txt 
		;;
esac
