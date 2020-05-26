#!/bin/bash

user=$1
service=$2
directory=`dirname "$service"`
file=`basename "$service"`

if [ $# -ne 2 ]; then
	echo "Error, parameters problem"
	exit 0

elif [ ! -d $user ]; then
	echo "Error, user does not exist"
	exit 1

elif [ ! -e "$user/$service" ]; then
	echo "Error, service does not exist"
	exit 2

else
	rm $user/$directory/$file
	echo "Ok: service removed"
	exit 3

fi
