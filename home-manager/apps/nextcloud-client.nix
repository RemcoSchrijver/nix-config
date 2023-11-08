{ config, pkgs, theme, ... }:

{
    services.nextcloud-client = {
        enable = true;
        startInBackground = true;
    };
}

