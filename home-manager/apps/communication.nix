{ config, pkgs, theme, ... }:

{
  home.packages = [
    # Matrix
    pkgs.fluffychat

    # Mattermost
    pkgs.mattermost-desktop

    # Zoom
    pkgs.zoom-us
  ];
}

