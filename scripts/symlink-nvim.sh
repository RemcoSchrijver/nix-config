#!/usr/bin/env bash
# Script that symlinks the directory for neovim config in this repo to your personal path.

mkdir ~/.config/nvim
sudo chown -R "${USER}" ~/.local

ln -s ../home-manager/apps/nvim/dotfiles/*  ~/.config/nvim

sudo chown -R "${USER}" ~/.local
sudo chown -R "${USER}" ~/.config/nvim

