#!/usr/bin/env sh
# Script that symlinks the directory for neovim config in this repo to your personal path.

set -eou pipefail

mkdir -p ~/.config/tmux
sudo chown -R "${USER}" ~/.local

ln -s ~/nix-config/home-manager/apps/tmux/dotfiles/*  ~/.config/tmux

sudo chown -R "${USER}" ~/.local
sudo chown -R "${USER}" ~/.config/tmux

echo "Done symlinking tmux config"

