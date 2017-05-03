#!/bin/sh

yad --on-top --form --undecorated --no-buttons \
    --columns="1" \
    --field="!/usr/share/icons/hicolor/32x32/apps/firefox.png! Firefox :fbtn" "bash from-firefox.sh" \
    --field="!/usr/share/icons/hicolor/32x32/apps/google-chrome.png! Chrome :fbtn" "bash from-chrome.sh" &

wmctrl -a "Yad"
