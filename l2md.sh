#!/bin/bash


OUT=$(echo $1 | sed "s/\.[^\.]*$//g").md


function mdwrite() {

    echo "[$2]($1)"

}


function possibleclip() {

    which xclip > /dev/null 2>&1
        [ $? -eq 0 ] &&
            cat $1 | xclip -selection c

}


function text() {

    TEXT=$( wget -q $URL -O- | grep "<title>" | head -n 1 |
                sed -e "s/^.*<title>//g" -e "s/<\/title>.*$//g" )
    if [ -z "$TEXT" ]
    then
        echo $URL | sed "s/^.*\/\([^\/]*\)$/\1/g"
    else
        echo "$TEXT"
    fi

}


function doall() {

    while read URL
    do 
        mdwrite "$URL" "`text`"
    done < $1

}


doall $1 > $OUT
possibleclip $OUT

