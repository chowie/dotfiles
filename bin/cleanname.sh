#!/usr/bin/bash

_cleanName() {

    OIFS="$IFS"
    IFS=$'\n'
    for i in "$@"; 
    do
        SOURCE_FILE=$i
        fullname=$(basename "$i")
        #extension="${fullname##*.}"
        #NEW_NAME=`echo "$i" | sed 's/\-[^-]*\.'//`
        NEW_NAME=`echo "$i" | sed 's/\-.*\.'//`
        echo $NEW_NAME

        #ffmpeg -i "$SOURCE_FILE" -c:a aac -b:a 256k "${NEW_NAME}.m4a"

    done;
    IFS="$OIFS"


}

_cleanName "$@" 
