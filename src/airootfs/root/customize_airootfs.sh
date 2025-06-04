#!/bin/bash
set -e

### replace gnome wallpapers ###
echo "configure-desktop-dprk pacman hook ran."
rm /usr/share/backgrounds/gnome/*
mv /etc/wallpapers/* /usr/share/backgrounds/gnome/


### gsettings ###

# left window buttons
gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"


### gnome extensions ###

array=( https://extensions.gnome.org/extension/3193/blur-my-shell/
https://extensions.gnome.org/extension/19/user-themes/
https://extensions.gnome.org/extension/307/dash-to-dock/ )

for i in "${array[@]}"
do
    EXTENSION_ID=$(curl -s $i | grep -oP 'data-uuid="\K[^"]+')
    VERSION_TAG=$(curl -Lfs "https://extensions.gnome.org/extension-query/?search=$EXTENSION_ID" | jq '.extensions[0] | .shell_version_map | map(.pk) | max')
    wget -O ${EXTENSION_ID}.zip "https://extensions.gnome.org/download-extension/${EXTENSION_ID}.shell-extension.zip?version_tag=$VERSION_TAG"
    gnome-extensions install --force ${EXTENSION_ID}.zip
    if ! gnome-extensions list | grep --quiet ${EXTENSION_ID}; then
        busctl --user call org.gnome.Shell.Extensions /org/gnome/Shell/Extensions org.gnome.Shell.Extensions InstallRemoteExtension s ${EXTENSION_ID}
    fi
    gnome-extensions enable ${EXTENSION_ID}
    rm ${EXTENSION_ID}.zip
done


### gtk theme ###

git clone https://github.com/vinceliuice/WhiteSur-gtk-theme
chmod +x WhiteSur-gtk-theme/install.sh
chmod +x WhiteSur-gtk-theme/tweaks.sh
./WhiteSur-gtk-theme/install.sh -d /usr/share/themes -l -n Taeyang -c light -t red --shell -i simple --silent-mode
./WhiteSur-gtk-theme -g -b "/etc/default-wallpaper/wallpaper.png"
rm -rf Whitesur-gtk-theme
gsettings set org.gnome.desktop.interface gtk-theme 'Taeyang'


### icon theme ###

git clone https://github.com/vinceliuice/WhiteSur-icon-theme
chmod +x Whitesur-icon-theme/install.sh
./Whitesur-icon-theme/install.sh -d /usr/share/icons -n Taeyang-Icons -t red -a
rm -rf Whitesur-icon-theme
gsettings set org.gnome.desktop.interface icon-theme 'Taeyang-Icons'