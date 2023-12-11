{ config, pkgs, theme, ... }:

{
  home.packages = [
    pkgs.tigervnc
    pkgs.realvnc-vnc-viewer
    pkgs.nomachine-client
  ];
}
