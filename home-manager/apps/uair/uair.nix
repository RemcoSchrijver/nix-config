# KDE applications that are used by me.
{ config, pkgs, theme, ... }:

{
    home.packages = [
        pkgs.uair 
    ];


    xdg.configFile."uair".source = ./dotfiles;
}
