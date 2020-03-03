#!/bin/bash

PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
FILE="$PWD/.todos.csv"

function process_date() {
    date=$1
    case $date in
    "")
        date=$(date +"%m %b %a");;
    "today")
        date=$(date +"%m %b %a");;
    "tomorrow")
        today=$(date)
        date=$(date -d "$today + 1 days" +"%m %b %a");;
    "yesterday")
        today=$(date)
        date=$(date -d "$today - 1 days" +"%m %b %a");;
    *)
        today=$(date)
        date=$(date -d "$today + $date days" +"%m %b %a");;
    esac
    echo "$date"
}

echo "Add ToDo" | boxes -d headline
title=""
while [ -z "$title" ]
do
    echo -n "Title: "
    read title
done
echo -n "Description: "
read description
echo -n "Due Date: "
read date
echo -n "Priority(1/2/3): "
read priority



if [ -z "$description" ]
then
    description=$title
fi

date=$(process_date $date)

if [ -z "$priority" ]
then
    priority=3
fi

printf "0,%s,%s,%s,%s\n" "$date" "$priority" "$title" "$description" >> $FILE
sort -o $FILE $FILE
