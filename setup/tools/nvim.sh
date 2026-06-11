#!/bin/bash

VERSION="0.12.2"
ARCH=$(uname -m)

case "${ARCH}" in
"x86_64")
  ARCH="amd64"
  ;;
"arm64" | "aarch64")
  ARCH="arm64"
  ;;
*)
  echo "Unsupported architecture."
  exit 1
  ;;
esac

### nvim installation

if [[ ! -d "/opt/nvim-linux-${ARCH}" ]]; then
  wget https://github.com/neovim/neovim/releases/download/v${VERSION}/nvim-linux-${ARCH}.tar.gz
  sudo tar -xzf nvim-linux-${ARCH}.tar.gz -C /opt
  sudo ln -sf /opt/nvim-linux-${ARCH}/bin/nvim /usr/local/bin/nvim
  rm nvim-linux-${ARCH}.tar.gz
fi

### node packages

if command -v npm &> /dev/null; then
  sudo npm install -g tree-sitter-cli prettier
fi

### python packages

if command -v python &> /dev/null; then
  if [[ ! -d "~/.venv/nvim" ]]; then
    mkdir -p ~/.venv
    python -m venv ~/.venv/nvim
  fi
fi

### nvim plugins setup

nvim --headless "+Lazy! install" +qa
nvim --headless "+TSUpdate" +qa
