#!/bin/bash

mkfifo server.pipe

while true; do
     read -a input < server.pipe
     case "${input[1]}" in 
	init)
	        output=$(./init.sh  ${input[2]} &)
		echo -e $output > "${input[0]}.pipe"  ;; 
	insert)
		output=$(./insert.sh ${input[2]} ${input[3]} "" ${input[4]} &)
		echo -e $output > "${input[0]}.pipe" ;;
	show)
		output=$(./show.sh ${input[2]} ${input[3]} &)
		echo -e $output > "${input[0]}.pipe" ;;
	update) 
		newpayload="${input[@]:4:10}"  
		output=$(./insert.sh ${input[2]} ${input[3]} "f" $newpayload &)
		echo -e $output > "${input[0]}.pipe"  
		;;
	rm)
		output=$(./rm.sh ${input[2]} ${input[3]} &)
		echo -e $output > "${input[0]}.pipe" ;;
	ls)	
		output=$(./ls.sh ${input[@]:2} &)
		echo -e $output > "${input[0]}.pipe" ;;
		
	shutdown)
		echo "Server shut down!" > "${input[0]}.pipe" 
		rm server.pipe
		exit 0
		;;  
	*)
		echo "Error: bad request"
		exit 1
     esac
done



