#!/bin/bash

sudo apt update && sudo apt install -y  \
  stow                                  \
  wget                                  \
  tar                                   \
  nodejs                                \
  npm

if [[ ! -d "/opt/nvim-linux-x86_64" ]]; then
  wget https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-linux-x86_64.tar.gz
  sudo tar -xzf nvim-linux-x86_64.tar.gz -C /opt
  rm nvim-linux-x86_64.tar.gz
  echo "export PATH=/opt/nvim-linux-x86_64/bin:$PATH" >> $HOME/.bashrc
fi

sudo npm install -g tree-sitter-cli

cd $HOME/paraskun && stow . && cd
 
/opt/nvim-linux-x86_64/bin/nvim --headless "+Lazy! install" +qa
/opt/nvim-linux-x86_64/bin/nvim --headless "+TSUpdate" +qa

