#!/bin/bash

PASSWORD=$1

while getopts f: option;
do 
    case $option in
        f) PASSWORD=$(<$OPTARG);;
    esac
done


#Colors
FAIL='\033[31m'
SUCCESS='\033[32m'
CLEAR='\033[0m'

#Error messages
SHORT='Password length should be at least 10 characters'
NO_CAPITAL='Password should contain at least 1 capital letter'
NO_SMALL_LETTERS='Password should contain at least 1 small letter'
NO_NUMBER='Password should contain at least 1 number'



if [[ $PASSWORD =~ [A-Z] ]]
then
    if [[ $PASSWORD =~ [a-z] ]]
    then
        if [[ $PASSWORD =~ [0-9] ]]
        then
            if [ ${#PASSWORD} -ge 10 ] 
            then 
                echo -e "${SUCCESS}Passed"
                exit 0
            else
            echo -e "${FAIL}NOT PASSED!"
            echo -e ${FAIL}$SHORT
            exit 1
            fi
        else
            echo -e "${FAIL}NOT PASSED!"
            echo -e ${FAIL}$NO_NUMBER
            exit 1
        fi
    else
        echo -e "${FAIL}NOT PASSED!"
        echo -e ${FAIL}$NO_SMALL_LETTERS
        exit 1
    fi
else
    echo -e "${FAIL}NOT PASSED!"
    echo -e ${FAIL}$NO_CAPITAL
    exit 1
fi


