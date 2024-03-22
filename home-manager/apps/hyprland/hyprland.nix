{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    rofi
    pamixer
    brightnessctl
    wireplumber
    dunst
    networkmanagerapplet
    waybar
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    # Disables warning that there is not config, we import the config from our dotfiles.
    extraConfig = " ";
  };
  xdg.configFile."hypr".source = ./dotfiles;
}
