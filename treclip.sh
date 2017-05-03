#!/bin/sh

cd "$(dirname "$0")"

yad --on-top --form --undecorated --no-buttons \
    --columns="1" \
    --field="!/usr/share/icons/hicolor/48x48/apps/firefox.png! Firefox :fbtn" "bash from-firefox.sh" \
    --field="!/usr/share/icons/hicolor/48x48/apps/google-chrome.png! Chrome :fbtn" "bash from-chrome.sh" &

wmctrl -a "Yad"
