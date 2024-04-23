{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    libreoffice
  ];
}
