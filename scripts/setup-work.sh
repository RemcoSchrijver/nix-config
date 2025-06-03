#!/usr/bin/env bash

home-manager switch --flake ~/nix-config#work

echo "Symlinking OS files"
sudo ln -sf ~/.nix-profile/share/xsessions/i3.desktop /usr/share/xsessions/i3.desktop
