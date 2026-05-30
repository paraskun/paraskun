#!/bin/bash

sudo dnf install -y $(cat setup/ws-f43/pkg.list)
stow bash tmux nvim hypr ghostty walls waybar scripts sh

. setup/tools/nvim.sh

cat setup/ws-f43/.profile >> $HOME/.bash_profile

