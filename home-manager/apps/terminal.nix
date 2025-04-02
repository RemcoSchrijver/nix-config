{ config, pkgs, theme, ... }:

{
  home.packages = [
    pkgs.alacritty-theme
  ];

  home.sessionVariables = {
    TERMINAL = "alacritty";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      general.import = [
        "${pkgs.alacritty-theme}/share/alacritty-theme/rose_pine_dawn.toml"
      ];
      window = {
        opacity = 0.85;
      };
      scrolling = {
        history = 1000;
      };
      env = {
        TERM = "xterm-256color";
      };
    };
  };
}
