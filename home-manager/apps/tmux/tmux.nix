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

  xdg.configFile = {
    "tmux/tmux.conf" = {
      source = ./dotfiles/tmux.conf;
    };
    "tmux/plugins/tpm" = {
      source = "${inputs.tmux-tpm}/";
    };
  };
}
