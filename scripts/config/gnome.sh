#!/usr/bin/env bash

if [[ $DESKTOP_SESSION = "gnome" ]] then
	gsettings set org.gnome.desktop.input-sources show-all-sources true
	gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'eu'), ('xkb', 'de')]"
fi

gsettings set org.gnome.desktop.interface enable-hot-corners false
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'