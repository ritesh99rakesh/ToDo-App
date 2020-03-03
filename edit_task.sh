#!/bin/bash

PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
FILE="$PWD/.todos.csv"

printf "Toggle a task done (Enter for yes): "
read -s -n 1 key

if [[ $key = "" ]]
then 
    printf "\nEdit task number: "
    read tasknum
    awk -F"," -v lineNum="$tasknum" -v OFS="," '{
            if (NR==lineNum) {
                if ($1 == "0") {
                    $1="1"
                }
                else
                    $1="0"
            }
            print
        }' $FILE > "$FILE.tmp" && mv "$FILE.tmp" $FILE
fi

sort -o $FILE $FILE
