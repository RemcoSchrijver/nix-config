{ inputs
, lib
, config
, pkgs
, ...
}: {
  services.displayManager.sddm.enable = true;
  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    # Enable the KDE Plasma Desktop Environment.
    desktopManager.plasma5.enable = true;
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.systemPackages = with pkgs; [
    # Encrypt folders 
    libsForQt5.plasma-vault
  ];

  # Setup theme
  environment.variables.GTK_THEME = "rose-pine-dawn";
  environment.variables.XCURSOR_THEME = "BreezeX-RosePineDawn-Linux";
  environment.variables.XCURSOR_SIZE = "24";
}
