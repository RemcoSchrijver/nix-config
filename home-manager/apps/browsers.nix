{ config, pkgs, theme, ... }:

{
  # Extra packages necessary for firefox
  # home.packages = [ 
  # pkgs.libsForQt5.plasma-browser-integration 
  # ];

  # Firefox
  programs.firefox = {
    enable = true;
    profiles.remco = {
      settings = {
        "general.smoothScroll" = true;

        # Don't have to be warned on aboutConfig.
        "browser.aboutConfig.showWarning" = false;

        # Turn off remember password prompts.
        "signon.remeberSignons" = false;
      };
    };
  };

  # Chromium
  programs.chromium = {
    enable = true;
  };
}

