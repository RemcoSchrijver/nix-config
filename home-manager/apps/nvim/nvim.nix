{ config, pkgs, inputs, ... }:

{
  home.packages = [
    pkgs.nixpkgs-fmt
    pkgs.cargo
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # Enable other frameworks for plugins.
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    # Setup aliasing.
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Using normal neovim config to allow reuse on other systems.
  };

  xdg.configFile."nvim".source = ./dotfiles;
}
