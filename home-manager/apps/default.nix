{ config, pkgs, ...}:

{
  imports = [
    ./nvim/nvim.nix
    ./firefox.nix
    ./chromium.nix
    ./git.nix
    ./direnv.nix
    ./mattermost.nix
    ./matrix.nix
    ./spotify.nix
    ./simplescreenrecorder.nix
    ./qpwgraph.nix
    ./nextcloud-client.nix
    ./jetbrains.nix
    ./zoom.nix
    ./kde.nix
    ./zotero.nix
    ./game-dependencies.nix
  ];
}
