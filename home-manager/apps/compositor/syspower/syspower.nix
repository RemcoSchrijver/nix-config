{ osConfig, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    syspower
  ];

  xdg.configFile = {
    "sys64/power/config.conf".source = ./dotfiles/config.conf;
  };
}
