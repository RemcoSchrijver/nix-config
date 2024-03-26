# KDE applications that are used by me.
{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    kdePackages.kclock
    kdePackages.merkuro
    kup
    kaffeine
  ];
}

