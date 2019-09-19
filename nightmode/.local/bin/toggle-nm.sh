#!/usr/bin/bash

if [ "$(gsettings get org.gnome.desktop.interface gtk-theme)" == "'Adwaita'" ]; then
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
    gsettings set com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/ palette "['#282828', '#CC241D', '#98971A', '#D79921', '#458588', '#B16286', '#689D6A', '#A89984', '#FBF1C7', '#FB4934', '#B8BB26', '#FABD2F', '#84A598', '#D3869B', '#8EC07C', '#EBDBB2']"
    notify-send "Night Mode" "Dark theme is enabled"
else
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
    gsettings set com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d/ palette "['#F9F5D7', '#CC241D', '#98971A', '#D79921', '#458588', '#B16286', '#689D6A', '#7C6F64', '#928374', '#9D0006', '#79740E', '#B57614', '#076678', '#8F3F71', '#427B58', '#3C3836']"
    notify-send "Night mode" "Light theme is enabled"
fi
