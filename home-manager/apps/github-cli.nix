{ config, pkgs, theme, ... }:

{
    programs.gh = {
        enable = true;
        settings = {
            editor = "nvim";
            git_protocol = "https";
        };
    };
}

