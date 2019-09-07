#!/usr/bin/bash

if [ "$(gsettings get org.gnome.desktop.interface gtk-theme)" == "'Adwaita'" ]; then
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
    notify-send "Night mode is ENABLED"
else
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
    notify-send "Night mode is DISABLED"
fi
