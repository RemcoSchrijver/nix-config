#!/usr/bin/env bash

NIXPKGS_ALLOW_UNFREE=1 home-manager switch --impure --flake ~/nix-config#work --extra-experimental-features nix-command --extra-experimental-features flakes && \
echo "Copying OS files" && \
sudo cp -f ~/.nix-profile/share/xsessions/i3.desktop /usr/share/xsessions/i3.desktop
