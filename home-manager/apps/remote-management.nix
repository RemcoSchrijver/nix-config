{ config, pkgs, theme, ... }:
{
  home.packages = [
    pkgs.tigervnc
    # pkgs.nomachine-client
  ];
}
