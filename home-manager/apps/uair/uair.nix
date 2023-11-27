# KDE applications that are used by me.
{ config, pkgs, theme, ... }:

{
    home.packages = [
        pkgs.uair 
        pkgs.yad
    ];


    xdg.configFile."uair".source = ./dotfiles;

    home.shellAliases = {
        uair = "uair | yad --progress --no-buttons --css=\"* { font-size: 80px; }\"";
    };
}
