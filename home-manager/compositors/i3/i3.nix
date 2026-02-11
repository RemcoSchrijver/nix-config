{ config, lib, pkgs, inputs, ... }:
{

  home.packages = with pkgs; [
    flameshot
    pamixer
    playerctl
  ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3;
  };

  xdg.configFile = {
    "i3/config" = lib.mkForce {
      source = ./dotfiles/config;
    };
  };
}

