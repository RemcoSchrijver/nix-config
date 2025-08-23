{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    kdePackages.kdenlive

    # Extra fonts
    vista-fonts
    corefonts
  ];
}
