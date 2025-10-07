#!/usr/bin/env bash

HOME_MANAGER_NEWS_DISPLAY=silent NIXPKGS_ALLOW_UNFREE=1 home-manager switch --show-trace --impure --flake ~/nix-config#work --extra-experimental-features nix-command --extra-experimental-features flakes && \
echo "Copying OS files" && \
sudo cp -f ~/.nix-profile/share/xsessions/i3.desktop /usr/share/xsessions/i3.desktop
