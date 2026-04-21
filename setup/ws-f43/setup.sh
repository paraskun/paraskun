#!/bin/bash

touch $HOME/.bash_profile

sudo dnf install -y $(cat setup/ws-f43/pkg.list)
stow tmux nvim hypr ghostty walls waybar scripts

. setup/util/nvim.sh

cat setup/ws-f43/.profile >> $HOME/.bash_profile

