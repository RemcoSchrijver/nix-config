{ config, pkgs, ... }:

{
  imports = [
    ./3d-printing
    ./browsers.nix
    ./communication.nix
    ./compositor
    ./direnv.nix
    ./editors.nix
    ./esp-programming.nix
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
    ./tmux/tmux.nix
    ./uair/uair.nix
    ./terminal.nix
    ./zotero.nix
  ];
}
