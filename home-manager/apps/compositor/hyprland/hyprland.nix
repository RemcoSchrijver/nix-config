{ osConfig, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    blueman
    pamixer
    brightnessctl
    wireplumber
    networkmanagerapplet
    libsForQt5.polkit-kde-agent
    libsForQt5.kwallet
    libsForQt5.kwallet-pam
  ];

  programs.kitty.enable = true;

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    extraConfig = '' 
        source = ./configs/exec.conf
        source = ./configs/settings.conf
        source = ./configs/windowrules.conf
        source = ./configs/keybinds.conf
    '';
        # ${(if osConfig.networking.hostName == "rs-thinkpad-nixos" then "source = ./configs/hosts/thinkpad.conf" else "")}

  };

  # Link config files
  xdg.configFile = {
    "hypr/configs".source = ./dotfiles;
  };
}
