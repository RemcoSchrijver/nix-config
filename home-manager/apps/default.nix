{ config, pkgs, specialArgs, ... }:
let
  inherit (specialArgs) hasUI;
in
{
  imports =
    let
      ui_imports = [
        ./3d-printing
        ./browsers.nix
        ./communication.nix
        ./compositor
        ./jetbrains.nix
        ./kde.nix
        ./media.nix
        ./qpwgraph.nix
        ./remote-management.nix
        ./simplescreenrecorder.nix
        ./zotero.nix
        ./office-suite.nix
      ];
    in
    [
      ./direnv.nix
      ./editors.nix
      ./esp-programming.nix
      ./game-dependencies.nix
      ./git.nix
      ./nextcloud-client.nix
      ./nvim/nvim.nix
      ./tmux/tmux.nix
      ./uair/uair.nix
      ./terminal.nix
    ] ++
    (if hasUI then ui_imports else [ ]);
}
