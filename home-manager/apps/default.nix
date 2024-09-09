{ config, pkgs, specialArgs, ... }:
let
  inherit (specialArgs) hasUI hasGaming hasKDE hasHyprland;
in
{
  imports =
    let
      ui_imports = [
        ./3d-printing
        ./browsers.nix
        ./communication.nix
        ./jetbrains.nix
        ./media.nix
        ./remote-management.nix
        ./simplescreenrecorder.nix
        ./office-suite.nix
      ];
      gaming_imports = [
        ./ryujinx.nix
        ./game-dependencies.nix
      ];
      kde_imports = [ ./kde.nix ];
      hyprland_imports = [ ./compositor ];
    in
    [
      ./direnv.nix
      ./editors.nix
      ./esp-programming.nix
      ./git.nix
      ./nextcloud-client.nix
      ./nvim/nvim.nix
      ./tmux/tmux.nix
      ./terminal.nix
    ] ++
    (if hasUI then ui_imports else [ ]) ++
    (if hasUI && hasKDE then kde_imports else [ ]) ++
    (if hasUI && hasHyprland then hyprland_imports else [ ]) ++
    (if hasGaming then gaming_imports else [ ]);
}
