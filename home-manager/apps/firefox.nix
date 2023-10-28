{ config, pkgs, theme, ... }:

{
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
}

