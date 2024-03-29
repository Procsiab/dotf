#!/usr/bin/bash

if [ "$(gsettings get org.gnome.desktop.interface color-scheme)" == "'default'" ]; then
    # Toggle DARK variant
    gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"
    # Light cursor theme (Oreo)
#    gsettings set org.gnome.desktop.interface cursor-theme 'oreo_white_cursors'
    # Legacy app dark theme
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"
    # Change Tilix color palette
    gsettings set com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/1c17067d-8dcc-49f8-af7d-af3a8504a6e2/ palette "['#282828', '#CC241D', '#98971A', '#D79921', '#458588', '#B16286', '#689D6A', '#A89984', '#FBF1C7', '#FB4934', '#B8BB26', '#FABD2F', '#84A598', '#D3869B', '#8EC07C', '#EBDBB2']"
    gsettings set com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/1c17067d-8dcc-49f8-af7d-af3a8504a6e2/ background-color "#282828"
    gsettings set com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/1c17067d-8dcc-49f8-af7d-af3a8504a6e2/ foreground-color "#FBF1C7"
    # Change Zathura's theme
    sed -i '0,/lightcolor "#F8F8F1"/s//lightcolor "#2E3436"/' ~/.config/zathura/zathurarc
    sed -i '0,/darkcolor "#2E3436"/s//darkcolor "#F8F8F1"/' ~/.config/zathura/zathurarc
    sed -i 's/-bg "#fbf1c7"/-bg "#282828"/g' ~/.config/zathura/zathurarc 
    sed -i 's/-fg "#282828"/-fg "#fbf1c7"/g' ~/.config/zathura/zathurarc 
    # Notify the user
    notify-send "Night Mode" "Dark theme is enabled" -i weather-clear-night -t 3000
else
    # Toggle LIGHT variant
    gsettings set org.gnome.desktop.interface color-scheme "default"
    # Dark cursor theme (Oreo)
#    gsettings set org.gnome.desktop.interface cursor-theme 'oreo_grey_cursors'
    # Legacy app light theme
    gsettings set org.gnome.desktop.interface gtk-theme "Adwaita"
    # Change Tilix color palette
    gsettings set com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/1c17067d-8dcc-49f8-af7d-af3a8504a6e2/ palette "['#F9F5D7', '#CC241D', '#98971A', '#D79921', '#458588', '#B16286', '#689D6A', '#7C6F64', '#928374', '#9D0006', '#79740E', '#B57614', '#076678', '#8F3F71', '#427B58', '#3C3836']"
    gsettings set com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/1c17067d-8dcc-49f8-af7d-af3a8504a6e2/ background-color "#F8F8F5"
    gsettings set com.gexperts.Tilix.Profile:/com/gexperts/Tilix/profiles/1c17067d-8dcc-49f8-af7d-af3a8504a6e2/ foreground-color "#3C3836"
    # Change Zathura's theme
    sed -i '0,/darkcolor "#F8F8F1"/s//darkcolor "#2E3436"/' ~/.config/zathura/zathurarc
    sed -i '0,/lightcolor "#2E3436"/s//lightcolor "#F8F8F1"/' ~/.config/zathura/zathurarc
    sed -i 's/-bg "#282828"/-bg "#fbf1c7"/g' ~/.config/zathura/zathurarc 
    sed -i 's/-fg "#fbf1c7"/-fg "#282828"/g' ~/.config/zathura/zathurarc 
    # Notify the user
    notify-send "Night mode" "Light theme is enabled" -i weather-clear -t 3000
fi
