{ config, pkgs, theme, ... }:

{
  home.packages = [
    pkgs.jellyfin-media-player
    pkgs.spotify
  ];
}
