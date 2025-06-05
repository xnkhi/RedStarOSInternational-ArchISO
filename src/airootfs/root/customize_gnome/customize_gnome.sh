#!/bin/bash


### replace gnome wallpapers ###

echo "configure-desktop-dprk running."
rm /usr/share/backgrounds/gnome/*
mv /root/customize_gnome/wallpapers/* /usr/share/backgrounds/gnome/


### gnome extensions ###

echo "Installing gnome extensions."
mv -f /root/customize_gnome/extensions/* /usr/share/gnome-shell/extensions/
gnome-extensions enable "user-theme@gnome-shell-extensions.gcampax.github.com"
gnome-extensions enable "dash-to-dock@micxgx.gmail.com"
gnome-extensions enable "blur-my-shell@aunetx"


### gtk theme ###


echo "Running Whitesur gtk Installer."
chmod +x /root/customize_gnome/taeyang/WhiteSur-gtk-theme/install.sh
chmod +x /root/customize_gnome/taeyang/WhiteSur-gtk-theme/tweaks.sh
/root/customize_gnome/taeyang/WhiteSur-gtk-theme/install.sh -d /usr/share/themes -l -n Taeyang -c light -t red --shell -i simple --silent-mode -f
/root/customize_gnome/taeyang/WhiteSur-gtk-theme/tweaks.sh -g -b "/etc/default-wallpaper/wallpaper.png"


### icon theme ###
echo "Running WhiteSur icons Installer"
chmod +x /root/customize_gnome/taeyang/WhiteSur-icon-theme/install.sh
/root/customize_gnome/taeyang/WhiteSur-icon-theme/install.sh -d /usr/share/icons -n Taeyang-Icons -t red -a


### gsettings ###

gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.desktop.interface gtk-theme "Taeyang"
gsettings set org.gnome.shell.extensions.user-theme name "Taeyang"
gsettings set org.gnome.desktop.interface icon-theme "Taeyang-Icons"



### cleanup ###