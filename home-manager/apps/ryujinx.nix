{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    ryujinx
  ];
}
