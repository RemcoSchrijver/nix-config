#!/usr/bin/env sh
# Script that symlinks the directory for neovim config in this repo to your personal path.

set -eou pipefail

mkdir -p ~/.config/nvim
sudo chown -R "${USER}" ~/.local

ln -sf ~/nix-config/home-manager/apps/nvim/dotfiles/*  ~/.config/nvim
rm -f ~/.config/nvim/.lazy-lock.json

sudo chown -R "${USER}" ~/.local
sudo chown -R "${USER}" ~/.config/nvim

echo "Done symlinking neovim config"

if [ -n "$JAVA_HOME" ]; then
    echo ""
    echo "You have a java version, lets do some variable magic to get the jdtls config to co-operate"
    dir=$(cd -- "$(dirname -- "$0")" && pwd)
    line=". \"$dir/update-env-for-jdtls-on-non-nixos.sh\""
    grep -qxF "$line" "$HOME/.bashrc" 2>/dev/null || echo "$line" >> "$HOME/.bashrc"
fi

if ! command -v nvim > /dev/null 2>&1; then
    echo ""
    echo "Looks like you didn't install neovim yet though"
fi


