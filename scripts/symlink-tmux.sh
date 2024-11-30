#!/usr/bin/env bash
# Script that symlinks the directory for neovim config in this repo to your personal path.

mkdir ~/.config/tmux
sudo chown -R "${USER}" ~/.local

ln -s ~/nix-config/home-manager/apps/tmux/dotfiles/*  ~/.config/tmux

sudo chown -R "${USER}" ~/.local
sudo chown -R "${USER}" ~/.config/tmux

