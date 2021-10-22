#!/bin/bash
function try()
{
    [[ $- = *e* ]]; SAVED_OPT_E=$?
    set +e
}

function throw()
{
    exit $1
}

function catch()
{
    export exception_code=$?
    (( $SAVED_OPT_E )) && set +e
    return $exception_code
}
clear
echo "  _               _             _           _   
 | |             | |           | |         | |  
 | |__   ___  ___| | _____ _ __| |__   ___ | |_ 
 | '_ \ / _ \/ __| |/ / _ \ '__| '_ \ / _ \| __|
 | | | |  __/ (__|   <  __/ |  | |_) | (_) | |_ 
 |_| |_|\___|\___|_|\_\___|_|  |_.__/ \___/ \__|"
echo " "
echo " "
echo "- Installing modules..."
try
(
    echo "- Installing discord..."
    pip install discord 1&>/dev/null
    echo "- Installed discord!"
    echo "- Installing praw..."
    pip install praw 1&>/dev/null
    echo "- Installed praw!"
    echo "- Installing slash commands..."
    pip install discord-py-slash-command 1&>/dev/null
    echo "- Complete!"
    echo -n "? Would you like to run the file? (y/n):"
    read inp
    if [ $inp == "y" ]
    then
        python $PWD/bot.py
        return
    elif [ $inp == "n" ]
    then
        echo "- Exiting..."
        exit
    else
        echo "! Invalid input. Exiting"
        exit
    fi
)
catch || {
   case $exc_code in
        *)
            echo "! Error installing modules"
            throw $exc_code
        ;;
    esac
}
