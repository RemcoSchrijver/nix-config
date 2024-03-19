{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
  };
  xdg.configFile."hypr".source = ./dotfiles;
}
