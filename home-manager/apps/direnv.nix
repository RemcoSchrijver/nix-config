{ config, pkgs, theme, ... }:

{
    programs = {
        direnv = {
            enable = true;
            enableBashIntegration = true;
            nix-direnv.enable = true;
        };
        bash.enable = true;
    };

}
