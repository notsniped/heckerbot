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
)
catch || {
   case $exc_code in
        *)
            echo "! Error installing modules"
            throw $exc_code
        ;;
    esac
}
