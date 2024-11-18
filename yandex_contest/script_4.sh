#!/bin/bash

function scheme() {
	res=$(echo "$1" | grep -Po "^(https://)|^(http://)")
	echo "$res"
}

function host() {
	OIFS=$IFS
	IFS="/"
	for host in $1 ; do
		res=${host%:*}
		break
	done	
	IFS=$OIFS
	echo "$res"
}

function port() {
	res=$(echo "$1" | grep -Po "(?<=:)(\d+)")
	echo "$res"	
}

true > output.txt
while IFS= read -r item ; do
	item=${item//google/yandex}
	sh=$(scheme "$item")
	if [ "$sh" ] ; then
		echo "Scheme: $sh"  >> output.txt
		item=$(echo "$item" |sed -r 's|'"$sh"'||')
	fi
	hst=$(host "$item")
	echo "Host: $hst"  >> output.txt
	item=$(echo "$item" | sed -r 's|'"$hst"'||')
	port=$(port "$item")
	if [ "$port" ] ; then
		echo "Port: $port" >> output.txt
	fi
	item=$(echo "$item" | grep -Po "(?<=[?]).*" )
	OIFS=$IFS
	IFS="&"
	is_args=""
	for arg in $item ; do
		key=${arg%=*}
		value=${arg#*=}
		if [[ -z "$is_args" ]] ; then
			echo "Args:"  >> output.txt
			is_args=1
		fi	
		echo "  Key: $key; Value: $value" >> output.txt
	done
	IFS=$OIFS
	echo >> output.txt
done < input.txt
