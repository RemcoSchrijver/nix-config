{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    # Matrix
    fluffychat

    # Signal
    scli

    # Whatsapp and Telegram
    nchat
  ];
}

