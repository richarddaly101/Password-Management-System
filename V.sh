#! /bin/bash

if [ -z "$1" ]; then
         echo "Usage $1 mutex-name"
         exit 1
else 
	rm "$1-lock"
	echo "Lock Removed"
	exit 0
fi
