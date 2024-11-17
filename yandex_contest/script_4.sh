#!/bin/bash

function scheme() {
	res=$(echo $1 | grep -Po "^(https://)|(http://)")
	echo $res
}

function host() {
	res=$(echo $1 | grep -Po "(^.+(?=:))|(^.+(?=(\/)))|(^.+(?=$))")
	echo $res
}

function port() {
	res=$(echo $1 | grep -Po "(?<=:)(\d+)")
	echo $res	
}


for item in $(cat input.txt) ; do
	sh=$(scheme $item)
	if [ $sh ] ; then
		echo "Scheme: $sh"
		item=$(echo $item |sed -r 's|'"$sh"'||')
	fi
	hst=$(host $item)
	echo "Host: $hst"
	item=$(echo $item | sed -r 's|'"$hst"'||')
	port=$(port $item)
	if [ $port ] ; then
		echo "Port: $port"
	fi
	item=$(echo $item | grep -Po "(?<=[?]).*" )
	echo $item
done
