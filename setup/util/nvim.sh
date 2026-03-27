#!/bin/bash

ARCH=$(uname -m)
touch $HOME/.bash_profile

### nvim installation

if [[ ! -d "/opt/nvim-linux-${ARCH}" ]]; then
  wget https://github.com/neovim/neovim/releases/download/v0.11.6/nvim-linux-${ARCH}.tar.gz
  sudo tar -xzf nvim-linux-${ARCH}.tar.gz -C /opt
  rm nvim-linux-${ARCH}.tar.gz
  echo "export PATH=/opt/nvim-linux-${ARCH}/bin:$PATH" >> $HOME/.bash_profile
fi

### node packages

sudo npm install -g tree-sitter-cli

if [[ ! -d "$HOME/.deno/bin" ]]; then
  curl -fsSL https://deno.land/install.sh | sh
fi

### python packages

mkdir ~/.venv
python -m venv ~/.venv/nvim

### nvim plugins setup

/opt/nvim-linux-${ARCH}/bin/nvim --headless "+Lazy! install" +qa
/opt/nvim-linux-${ARCH}/bin/nvim --headless "+TSUpdate" +qa

