{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    kdePackages.kdenlive

    # Plugins
    cmt
    ladspaPlugins

    # Extra fonts
    vista-fonts
    corefonts
  ];
}
