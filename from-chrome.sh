#!/bin/bash


function doall() {
    
    bookmarker -p "`xclip -o`" | grep "*" | sed "s/\* //g"

}

doall | xclip -selection c

