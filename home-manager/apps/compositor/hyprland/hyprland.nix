{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    rofi
    pamixer
    brightnessctl
    wireplumber
    dunst
    networkmanagerapplet
    libsForQt5.polkit-kde-agent
    libsForQt5.kwallet
    hyprpaper
    hyprshot
  ];

  home.sessionVariables = {
      HYPRSHOT_DIR = "~/Pictures/Screenshots/";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    # Disables warning that there is not config, we import the config from our dotfiles.
    extraConfig = " ";
  };

  # Move config
  xdg.configFile = {
    "hypr/hyprland.conf".source = ./dotfiles/hyprland.conf;
    "hypr/hyprpaper.conf".source = ./dotfiles/hyprpaper.conf;
    "hypr/oceandrone1.jpg".source = ./dotfiles/oceandrone1.jpg;
  };
}
