{ osConfig, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    hyprshot
  ];

  home.sessionVariables = {
    HYPRSHOT_DIR = "Pictures/Screenshots/";
  };
}
