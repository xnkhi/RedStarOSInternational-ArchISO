#!/bin/bash


### replace gnome wallpapers ###
echo "configure-desktop-dprk ran."
rm /usr/share/backgrounds/gnome/*
mv /etc/wallpapers/* /usr/share/backgrounds/gnome/


### gnome extensions ###

urls=(
  "https://extensions.gnome.org/extension/3193/blur-my-shell/"
  "https://extensions.gnome.org/extension/19/user-themes/"
  "https://extensions.gnome.org/extension/307/dash-to-dock/"
)

for url in "${urls[@]}"; do
    EXTENSION_UUID=$(curl -s "$url" | grep -oP 'data-uuid="\K[^"]+')
    GNOME_VERSION=$(gnome-shell --version | grep -oP '\d+\.\d+')
    VERSION_TAG=$(curl -s "https://extensions.gnome.org/extension-info/?uuid=${EXTENSION_UUID}&shell_version=${GNOME_VERSION}" | jq '.version')

    curl -L -o "${EXTENSION_UUID}.zip" "https://extensions.gnome.org/download-extension/${EXTENSION_UUID}.shell-extension.zip?version_tag=${VERSION_TAG}"

    gnome-extensions install --force "${EXTENSION_UUID}.zip"
    gnome-extensions enable "${EXTENSION_UUID}"
    rm "${EXTENSION_UUID}.zip"
done


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
./WhiteSur-icon-theme/install.sh -d /usr/share/icons -n Taeyang-Icons -t red -a
rm -rf WhiteSur-icon-theme


### gsettings ###

gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
gsettings set org.gnome.desktop.interface gtk-theme 'Taeyang'
gsettings set org.gnome.desktop.interface icon-theme 'Taeyang-Icons'