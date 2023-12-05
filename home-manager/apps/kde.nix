# KDE applications that are used by me.
{ config, pkgs, theme, ... }:

{
  home.packages = [
    pkgs.libsForQt5.kclock
    pkgs.kup
    pkgs.kaffeine
  ];
}

