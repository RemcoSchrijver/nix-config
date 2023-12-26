{ config, pkgs, ... }:

{
  imports = [
    ./esp-programming.nix
    ./3d-printing
    ./browsers.nix
    ./communication.nix
    ./direnv.nix
    ./editors.nix
    ./game-dependencies.nix
    ./git.nix
    ./jetbrains.nix
    ./kde.nix
    ./media.nix
    ./nextcloud-client.nix
    ./nvim/nvim.nix
    ./qpwgraph.nix
    ./remote-management.nix
    ./simplescreenrecorder.nix
    ./uair/uair.nix
    ./zotero.nix
  ];
}
