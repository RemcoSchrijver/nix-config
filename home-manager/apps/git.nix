{ config, pkgs, theme, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
    lfs.enable = true;

    userName = "RemcoSchrijver";
    userEmail = "remco.schrijver@hotmail.com";

  };
}
