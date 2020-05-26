#!/bin/bash

directory=$1
if [ $# -ne 1 ]; then
	echo "Error: parameters problem"
	exit 0

elif [ ! -d $directory ]; then
	./P.sh $directory
	mkdir $directory
	echo "OK: user created"
	./V.sh $directory
	exit 1
else
    echo "Error: user already exists"
    exit 2	
fi

