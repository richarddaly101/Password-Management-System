#!/bin/bash

user=$1
service=$2
update=$3
payload=$4
dir=$(dirname $service)
base=$(basename $service)


if [ $# -ne 4 ]; then
	echo "Error, parameters problem"
	exit 0

elif [ ! -d $user ]; then
	echo "Error: User does not exist"
	exit 1

elif [  "$update" != "f" ] && [ -e "$user/$service" ]; then
	echo "Error: Service already exists"
	exit 2

elif [ ! -d "$user/$dir" ]; then
	./P.sh "$user"
	mkdir "$user/$dir"
	echo $payload > "$user/$dir/$base"
	echo "Ok: directory and file created"
	./V.sh "$user"
elif [ "$update" == "f" ] && [ -e "$user/$service" ]; then
	./P.sh "$user"
	echo $payload > "$user/$service"
	echo "Ok:service updated"
	./V.sh "$user"
else 
	./P.sh "$user"
	echo $payload > "$user/$service"
	echo "Ok: service created"
	./V.sh "$user"
echo 'checked'
fi



