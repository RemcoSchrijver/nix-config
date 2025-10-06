{ osConfig, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    sysauth
  ];

  xdg.configFile = {
    "sys64/auth/config.conf".source = ./dotfiles/config.conf;
  };
}
