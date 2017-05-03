#!/bin/bash


DB=$(find $HOME/.mozilla/firefox/*.default/places.sqlite)


function mdwrite() {

    echo "[$2]($1)"

}


function text() {

    sqlite3 $DB "SELECT DISTINCT moz_bookmarks.title, moz_places.url FROM moz_places
INNER JOIN moz_bookmarks ON moz_places.id = moz_bookmarks.fk WHERE moz_places.url = '$1'" | cut -d"|" -f1

}


function doall() {

    for URL in $(xclip -o -sel clip | sed 1d)
    do 
        URL=$(echo -n $URL | sed -e "s/\n//g" -e "s/\r//g")
        mdwrite "$URL" "`text $URL`"
    done

}

doall | xclip -selection c

