#!/bin/bash

export FLAVOUR="latte"

swww img --transition-type wipe $HOME/.walls/latte.png
ln -sf $HOME/.config/hypr/latte.conf $HOME/.config/hypr/theme.conf
ln -sf $HOME/.config/zathura/latte $HOME/.config/zathura/theme
kitty +kitten themes --reload-in=all latte
gsettings set org.gnome.desktop.interface color-scheme 'prefer-light'

