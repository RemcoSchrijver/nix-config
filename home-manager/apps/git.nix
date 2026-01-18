{ config, pkgs, theme, ... }:

{
  programs.git = {
    enable = true;
    package = pkgs.gitFull;
    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;

      user = {
        name = "RemcoSchrijver";
        email = "remco.schrijver@hotmail.com";
      };
    };
    lfs.enable = true;
  };
}
