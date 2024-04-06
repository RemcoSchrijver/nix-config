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
      import = [
        "${pkgs.alacritty-theme}/rose-pine-dawn.toml"
      ];
      window = {
        opacity = 0.85;
      };
    };
  };
}
