{ config, pkgs, theme, ... }:

{
  home.packages = [
    # Matrix
    # pkgs.fluffychat

    # Zoom
    pkgs.zoom-us

    # Slack
    pkgs.slack

    # Whatsapp
    pkgs.whatsapp-for-linux
  ];
}

