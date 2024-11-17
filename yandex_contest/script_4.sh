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

function arg_k() {
	res=$(echo $1 | grep -Po "^.*?(?=\=)")
	echo $res
}

> output.txt
for item in $(cat input.txt) ; do
	item=$(echo $item | sed 's/google/yandex/g')
	sh=$(scheme $item)
	if [ $sh ] ; then
		echo "Scheme: $sh" >> output.txt
		item=$(echo $item |sed -r 's|'"$sh"'||')
	fi
	hst=$(host $item)
	echo "Host: $hst" >> output.txt
	item=$(echo $item | sed -r 's|'"$hst"'||')
	port=$(port $item)
	if [ $port ] ; then
		echo "Port: $port" >> output.txt
	fi
	item=$(echo $item | grep -Po "(?<=[?]).*" )
	OIFS=$IFS
	IFS="&"
	is_args=""
	for arg in $item ; do
		key=${arg%=*}
		value=${arg#*=}
		if [[ -z "$is_args" ]] ; then
			echo "Args:" >> output.txt
			is_args=1
		fi	
		echo "  Key: $key; Value:  $value" >> output.txt
	done
	IFS=$OIFS
	echo >> output.txt
done
