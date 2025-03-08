#!/bin/bash

#Function to display usage
show_help(){
	echo "Usage: $0 <WORDLIST> <SC FILTER> <URL>"
	echo "   -h, --help    Display this help and exit"
	echo "the URL parameter should be entered in single quotes"
	echo
	echo "This script is a simple API fuzzer to help with parameter fuzzing in WFUZZ"
 	echo
  	echo "Example: ./api-fuzzer.sh wordlist.txt 200 'http://site.com/api/FUZZ'"
}


#Check if the help option is provided
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
	show_help
	exit 0
fi

#Check if the required arguments are provided
if [ "$#" -ne 3 ]; then
	show_help
	exit 1
fi

#Assign argument to variables
WORDLIST="$1"
SC="$2"
URL="$3"

#run the WFUZZ command
wfuzz -c -z file,$WORDLIST --sc $SC $URL
