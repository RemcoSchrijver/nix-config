{ config, pkgs, theme, ... }:

{
    home.packages = [
        pkgs.mattermost-desktop
    ];
}
