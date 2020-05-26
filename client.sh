#!/bin/bash

clientid=$1
service=$2
username=$3
file=$4
mkfifo "$clientid.pipe"

if [ $# -lt 2 ]; then
	echo "Error, parameters problem"
	exit 0
else
    case "$service" in
	init)
	if [ $# -ge 2 ]; then
        	echo "$@" > server.pipe
		echo "Request sent" 
		cat "$clientid.pipe"
	else
		echo "Error, parameters problem"
	fi
		rm "$clientid.pipe" ;;
	
    insert)  
	if [ $# -ge 3 ]; then
		echo "Please write login"
		read login
		echo "Please write password"
		read password
		payload="login:$login;password:$password"
		echo -e "$@" "$payload" > server.pipe
		cat "$clientid.pipe"
	else	
		echo "Error, parameters problem"
	fi
		rm "$clientid.pipe";;

	show)   
	if [ $# -ge 3 ]; then
		echo "$@" > server.pipe
		echo "Request sent"
		cat "$clientid.pipe"
	else
		echo "Error, paramters problem"
	fi
		rm "$clientid.pipe"
		;;
	update) 
	if [ $# -ge 3 ]; then
		content=$(./show.sh $3 $4)	 	 	
		tempfile=$(mktemp)
		echo "$content" > "$tempfile"
		nano "$tempfile"
		login="$(grep login $tempfile)"
		pass="$(grep password $tempfile)"
		sentpay="$login;$pass"
		echo -e "$@" "$sentpay" > server.pipe	 
		cat "$clientid.pipe"
		rm ${tempfile}
  	
        else 
		echo "Error, parameters problem"
	fi	
		rm "$clientid.pipe"	;;

	ls)   
	if [ $# -ge 3 ]; then
	        echo "$@" > server.pipe 
		echo "Request sent"     
		cat "$clientid.pipe"
	else
		echo "Error, parameters problem"
	fi 
                rm "$clientid.pipe" ;;
	rm) 
	if [ $# -ge 3 ]; then    
		echo "$@" > server.pipe
		echo "Request sent" 
		cat "$clientid.pipe"
	else
		echo "Error, parameters problem"

	fi
		rm "$clientid.pipe" ;;

	shutdown) 

		echo "$@" > server.pipe
		cat "$clientid.pipe"
		rm "$clientid.pipe"  ;;
           
    esac
    
fi 
