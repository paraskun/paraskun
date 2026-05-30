#!/bin/bash

sudo apt update && sudo apt install -y $(cat setup/dc-u04/pkg.list)
stow nvim

. setup/tools/nvim.sh

cat sh/.bash_profile >> $HOME/.bash_profile
cat sh/.bashrc >> $HOME/.bashrc
cat setup/dc-u04/.profile >> $HOME/.bashrc

