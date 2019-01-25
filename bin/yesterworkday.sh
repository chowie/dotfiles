#!/bin/bash

#autoload bashcompinit
#bashcompinit

function yesterworkday()
{
    if [[ "1" == "$(date +%u)" ]]
    then
        target="last friday"
    else
        target="yesterday"
    fi

    #git log --date=format:%c --pretty=format:"[%h] %s %b" --since="${target}"
    git log --pretty=format:"%Cred%h%Creset %C(white)%s%Creset (%C(blue)%cD%Creset) %C(Yellow)%d%Creset" --since="${target}"
}

export yesterworkday
