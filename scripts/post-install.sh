#!/bin/bash

echo "installing display and audio..."
sudo pacman -S pulseaudio pulseaudio-alsa pavucontrol \	
	xorg xorg-xinit xorg-server

echo "configuring login manager..."
sudo pacman -S lightm lightdm-gtk-greeter
sudo systemctl enable lightdm.service

echo "installing window manager..."
sudo pacman -S i3-gaps

echo "installing fonts..."
sudo pacman -S ttf-linux-libertine ttf-inconsolata ttf-fireflysung noto-fonts-cjk ttf-font-awesome

echo "installing editor..."
sudo pacman -S neovim python-neovim python2-neovim code

echo "installing primary desktop apps..."
sudo pacman -S firefox chromium ranger w3m zathura zathura-pdf-mupdf kitty

echo "installing utilities tools..."
sudo pacman -S acpi xdotool libnotify dunst gnome-keyring libsecret
