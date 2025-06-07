#!/bin/bash

export FLAVOUR="mocha"

swww img --transition-type wipe $HOME/.walls/mocha.jpg
ln -sf $HOME/.config/hypr/mocha.conf $HOME/.config/hypr/theme.conf
ln -sf $HOME/.config/zathura/mocha $HOME/.config/zathura/theme
kitty +kitten themes --reload-in=all mocha
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

