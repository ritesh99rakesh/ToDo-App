#!/bin/bash

PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
FILE="$PWD/.todos.csv"

function print_header() {
    printf "%-8s%-8s%-25s\t%-15s\t%-25s\t%-35s\n" "Task" "Done" "Date" "Priority" "Title" "Description"
    printf "________________________________________________________________________________________________________________________\n\n"
}

function view_task() {
    if [ -f $FILE ] && [ -s $FILE ]
    then
        print_header
        awk -F"," '{
            if ($3 == "1" && $1 == "0")
                printf "%-8s%-8s%-25s\t%-15s\t%-25s\t%-35s\n",NR,"[ ]",$2,"High",$4,$5;
            else if ($3 == "1" && $1 == "1")
                printf "%-8s%-8s%-25s\t%-15s\t%-25s\t%-35s\n",NR,"[X]",$2,"High",$4,$5;
            else if ($3 == "2" && $1 == "0")
                printf "%-8s%-8s%-25s\t%-15s\t%-25s\t%-35s\n",NR,"[ ]",$2,"Medium",$4,$5;
            else if ($3 == "2" && $1 == "0")
                printf "%-8s%-8s%-25s\t%-15s\t%-25s\t%-35s\n",NR,"[X]",$2,"Medium",$4,$5;
            else if ($1 == "0")
                printf "%-8s%-8s%-25s\t%-15s\t%-25s\t%-35s\n",NR,"[ ]",$2,"Low",$4,$5;
            else
                printf "%-8s%-8s%-25s\t%-15s\t%-25s\t%-35s\n",NR,"[X]",$2,"Low",$4,$5;
            }'  $FILE
    else
        printf "NO TODOS! ENJOY!!"
    fi
}

view_task | boxes -d shell
