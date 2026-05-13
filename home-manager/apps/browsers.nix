{ config, pkgs, theme, ... }:

{
  # Firefox
  programs.firefox = {
    configPath = "${config.xdg.configHome}/mozilla/firefox";
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

