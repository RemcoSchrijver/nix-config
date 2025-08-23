{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    libsForQt5.kdenlive

    # Extra fonts
    vista-fonts
    corefonts
  ];
}
