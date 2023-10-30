{ config, pkgs, ...}:

{
  imports = [
    ./nvim/nvim.nix
    ./firefox.nix
    ./git.nix
    ./direnv.nix
    ./mattermost.nix
    ./element.nix
    ./spotify.nix
  ];
}
