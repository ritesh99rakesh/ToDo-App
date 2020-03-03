#!/bin/bash

function do_continue() {
    read -s -n 1 key

    if ! [[ $key = "" ]]; then 
        exit 0
    fi

    printf "\n\n"
}

function view_task() {
    todo_screen
    bash $PWD/view_task.sh
    normal_screen
}

function print_menu() {
    echo "TODO" | boxes -d headline
    echo ""
    echo "a. Add"
    echo "e. Edit"
    echo "d. Delete"
    echo "x. Exit"
}

PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. $PWD/utils.sh

view_task

do_continue

while [ 1 ]
do
    print_menu | boxes -d shell

    echo -n "Enter choice: "
    read -s -n 1 choice
    echo -e "\n"

    case $choice in
    "a")
        bash $PWD/add_task.sh;;
    "e")
        bash $PWD/edit_task.sh;;
    "d")
        bash $PWD/delete_task.sh;;
    "x")
        exit 0;;
    *)
        echo "Wrong choice"
    esac

    view_task
    echo -n "Want to continue (Enter for yes): "
    do_continue
done
