#!/bin/bash

PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
FILE="$PWD/.todos.csv"

echo -n "Enter task number to delete: "
read tasknum

sed -i.bak -e "2d" $FILE
