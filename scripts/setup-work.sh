#!/usr/bin/env bash

NIXPKGS_ALLOW_UNFREE=1 home-manager switch --show-trace --impure --flake ~/nix-config#work --extra-experimental-features nix-command --extra-experimental-features flakes && \
echo "Copying OS files" && \
sudo cp -f ~/.nix-profile/share/wayland-sessions/hyprland.desktop /usr/share/wayland-sessions/hyprland.desktop && \
ln -sf ~/.nix-profile/bin/nixGLMesa ~/.local/bin/nixGL && \
sudo ln -sf /home/rschrijver/.local/bin/nixGL /usr/local/bin/nixGL
