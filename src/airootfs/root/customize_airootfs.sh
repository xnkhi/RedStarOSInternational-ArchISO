#!/bin/bash

### replace gnome wallpapers ###
echo "configure-desktop-dprk ran."
rm /usr/share/backgrounds/gnome/*
mv /etc/wallpapers/* /usr/share/backgrounds/gnome/


### gtk theme ###

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme
chmod +x WhiteSur-gtk-theme/install.sh
chmod +x WhiteSur-gtk-theme/tweaks.sh
echo "Running Whitesur Installer"
./WhiteSur-gtk-theme/install.sh -d /usr/share/themes -l -n Taeyang -c light -t red --shell -i simple --silent-mode
./WhiteSur-gtk-theme/tweaks.sh -g -b "/etc/default-wallpaper/wallpaper.png"
rm -rf WhiteSur-gtk-theme


### icon theme ###

git clone https://github.com/vinceliuice/WhiteSur-icon-theme
chmod +x WhiteSur-icon-theme/install.sh
echo "Running WhiteSur Icons Installer"
./Whitesur-icon-theme/install.sh -d /usr/share/icons -n Taeyang-Icons -t red -a
rm -rf WhiteSur-icon-theme