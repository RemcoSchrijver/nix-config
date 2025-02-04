{ config, pkgs, theme, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
      push.autoSetupRemote = true;
    };
    lfs.enable = true;

    userName = "RemcoSchrijver";
    userEmail = "remco.schrijver@hotmail.com";

  };
}
