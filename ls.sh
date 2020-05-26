#!/bin/bash

user=$1
folder=$2

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
	echo "Error, parameters problem"
	exit 0

elif [ ! -d $user ]; then
	echo "Error, user does not exist"
	exit 1

elif [ ! -d  $user/$folder ]; then
	echo "Error, folder does not exist"
	exit 2

else 
    if [ $# -eq 1 ]; then
	tree $1
	echo "OK:"
    elif [ $# -eq 2 ]; then
	tree $1/$2
	echo "OK:"

    fi
fi


