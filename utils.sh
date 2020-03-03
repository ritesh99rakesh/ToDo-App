#!/bin/bash

function getColorNum() {
    color=$1
    case $color in
    "black")
        return 0;;
    "red")
        return 1;;
    "green")
        return 2;;
    "yellow")
        return 3;;
    "blue")
        return 4;;
    "magenta")
        return 5;;
    "cyan")
        return 6;;
    *)
        return 7;;
    esac
}

function fgcolor() {
    getColorNum $1
    tput setaf $?
}

function bgcolor() {
    getColorNum $1
    tput setab $?
}

function todo_screen() {
    fgcolor "black"
    bgcolor "yellow"
}

function normal_screen() {
    fgcolor "white"
    bgcolor "black"
}
