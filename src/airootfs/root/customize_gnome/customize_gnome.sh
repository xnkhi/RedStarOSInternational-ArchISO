#!/bin/bash


### replace gnome wallpapers ###

echo "configure-desktop-dprk running."
rm /usr/share/backgrounds/gnome/*
mv /root/customize_gnome/wallpapers/* /usr/share/backgrounds/gnome/


### gnome extensions ###

echo "Installing gnome extensions."
gnome-extensions install --force "/root/customize_gnome/extensions/user-theme@gnome-shell-extensions.gcampax.github.com.zip"
gnome-extensions install --force "/root/customize_gnome/extensions/dash-to-dock@micxgx.gmail.com.zip"
gnome-extensions install --force "/root/customize_gnome/extensions/blur-my-shell@aunetx.zip"
gnome-extensions enable "/root/customize_gnome/extensions/user-theme@gnome-shell-extensions.gcampax.github.com.zip"
gnome-extensions enable "/root/customize_gnome/extensions/dash-to-dock@micxgx.gmail.com.zip"
gnome-extensions enable "/root/customize_gnome/extensions/blur-my-shell@aunetx.zip"


### gtk theme ###


echo "Running Whitesur gtk Installer."
chmod +x /root/customize_gnome/taeyang/WhiteSur-gtk-theme/install.sh
chmod +x /root/customize_gnome/taeyang/WhiteSur-gtk-theme/tweaks.sh
/root/customize_gnome/taeyang/WhiteSur-gtk-theme/install.sh -d /usr/share/themes -l -n Taeyang -c light -t red --shell -i simple --silent-mode
/root/customize_gnome/taeyang/WhiteSur-gtk-theme/tweaks.sh -g -b "/etc/default-wallpaper/wallpaper.png"


### icon theme ###
echo "Running WhiteSur icons Installer"
chmod +x /root/customize_gnome/taeyang/WhiteSur-icon-theme/install.sh
/root/customize_gnome/taeyang/WhiteSur-icon-theme/install.sh -d /usr/share/icons -n Taeyang-Icons -t red -a


### gsettings ###

gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.desktop.interface gtk-theme 'Taeyang'
gsettings set org.gnome.desktop.interface icon-theme 'Taeyang-Icons'


### cleanup ###

rm -rf /root/customize_gnome