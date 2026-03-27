#!/bin/bash

touch $HOME/.bash_profile

sudo apt update && sudo apt install -y $(cat setup/dc-u04/pkg.list)
stow nvim

. setup/util/nvim.sh

cat setup/dc-u04/.profile >> $HOME/.bash_profile

