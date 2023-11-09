{ config, pkgs, ...}:

{
  imports = [
    ./nvim/nvim.nix
    ./firefox.nix
    ./chromium.nix
    ./git.nix
    ./direnv.nix
    ./mattermost.nix
    ./element.nix
    ./spotify.nix
    ./simplescreenrecorder.nix
    ./qpwgraph.nix
    ./nextcloud-client.nix
    ./jetbrains.nix
  ];
}
