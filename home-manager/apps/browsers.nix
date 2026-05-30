{ config, pkgs, theme, ... }:

{
  # Firefox
  programs.firefox = {
    enable = true;
  };

  # Chromium
  programs.chromium = {
    enable = true;
  };
}

