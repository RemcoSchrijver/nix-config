{ config, pkgs, inputs, ... }:

{
  home.packages = [
  ];

  programs.tmux = {
    enable = true;

    # General settings
    clock24 = true;
    keyMode = "vi";
  };

  # xdg.configFile."tmux".source = ./dotfiles;
}
