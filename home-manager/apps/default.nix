{ config, pkgs, specialArgs, ... }:
let
  inherit (specialArgs) hasUI hasGaming;
in
{
  imports =
    let
      ui_imports = [
        ./3d-printing
        ./browsers.nix
        ./communication.nix
        # ./compositor
        ./jetbrains.nix
        ./kde.nix
        ./media.nix
        ./qpwgraph.nix
        ./remote-management.nix
        ./simplescreenrecorder.nix
        ./zotero.nix
        ./office-suite.nix
      ];
      gaming_imports = [
        ./ryujinx.nix
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
      ./terminal.nix
    ] ++
    (if hasUI then ui_imports else [ ]) ++
    (if hasGaming then gaming_imports else [ ]);
}
