#!/bin/bash

dir=$1
file=$2

if [ $# -ne 2 ]; then                               
	echo "Error, parameters problem"
	exit 0

elif [ ! -d $dir ]; then
	echo "Error, user does not exist"
	exit 1

elif [ ! -e "$dir/$file" ]; then
	echo "Error, service does not exist"
	exit 2
else 
	password=$(grep -i pass "$dir/$file")
	login=$(grep -i login "$dir/$file")
	echo "$password"
	echo "$login"

fi

                                                                                                                                                                                                                                                                                     
