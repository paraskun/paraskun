#!/bin/bash

export FLAVOUR="frappe"

swww img --transition-type outer $HOME/.walls/frappe.png
ln -sf $HOME/.config/hypr/frappe.conf $HOME/.config/hypr/theme.conf
ln -sf $HOME/.config/zathura/frappe $HOME/.config/zathura/theme
kitty +kitten themes --reload-in=all frappe
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'

