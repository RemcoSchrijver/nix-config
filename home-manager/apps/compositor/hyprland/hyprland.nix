{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    pamixer
    brightnessctl
    wireplumber
    dunst
    networkmanagerapplet
    libsForQt5.polkit-kde-agent
    libsForQt5.kwallet
    libsForQt5.kwallet-pam
    hyprpaper
    hyprshot
    hyprlock
  ];

  home.sessionVariables = {
    HYPRSHOT_DIR = "Pictures/Screenshots/";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    extraConfig = '' 
        source = ./configs/exec.conf
        source = ./configs/settings.conf
        source = ./configs/windowrules.conf
        source = ./configs/keymaps.conf
    '';
  };

  # Move config
  xdg.configFile = {
    "hypr/configs".source = ./dotfiles;
  };
}
