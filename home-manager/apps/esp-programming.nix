{ config, pkgs, theme, ... }:

{
  home.packages = [
    pkgs.cp210x-program
  ];
}
