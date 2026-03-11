#!/bin/bash

sudo apt update && sudo apt install -y  \
  stow                                  \
  wget                                  \
  tar

if [[ ! -d "/opt/nvim-linux-x86_64" ]]; then
  wget https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-linux-x86_64.tar.gz
  sudo tar -xzf nvim-linux-x86_64.tar.gz -C /opt
  rm nvim-linux-x86_64.tar.gz
  echo "export PATH=/opt/nvim-linux-x86_64/bin:$PATH" >> $HOME/.bashrc
fi

if [[ ! -d "/opt/tree-sitter-linux-x64" ]]; then
  wget https://github.com/tree-sitter/tree-sitter/releases/download/v0.26.6/tree-sitter-linux-x64.gz
  sudo mkdir -p /opt/tree-sitter-linux-x64/bin
  gunzip tree-sitter-linux-x64.gz
  sudo mv tree-sitter-linux-x64 /opt/tree-sitter-linux-x64/bin/tree-sitter
  rm tree-sitter-linux-x64.gz
  echo "export PATH=/opt/tree-sitter-linux-x64/bin:$PATH" >> $HOME/.bashrc
fi

cd $HOME/paraskun && stow . && cd
source $HOME/.bashrc
 
nvim --headless "+Lazy! install" +qa

