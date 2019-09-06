#!/usr/bin/bash

if [ "$(gsettings get org.gnome.desktop.interface gtk-theme)" == "'Adwaita'" ]; then
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
else
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
fi
