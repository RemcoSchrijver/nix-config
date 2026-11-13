{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    # Matrix
    fluffychat

    # Signal
    signal-desktop

    # Whatsapp and Telegram
    nchat
  ];
}

