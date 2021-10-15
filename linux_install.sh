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
echo "- Installing modules..."
try
(
    pip install discord > /dev/null
    echo "- Installed discord!"
    pip install praw > /dev/null
    echo "- Installed praw!"
    pip install discord-py-slash-command > /dev/null


)
catch || {
   case $ex_code in
        *)
            echo "! Error installing modules"
            throw $ex_code
        ;;
    esac
}
