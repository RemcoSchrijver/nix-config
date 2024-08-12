{ inputs
, lib
, config
, pkgs
, ...
}: {
  programs.hyprland = {
    enable = true;
  };


  # Enable screen sharing on wayland
  # xdg = {
  #   portal = {
  #     enable = true;
  #     extraPortals = with pkgs; [
  #       xdg-desktop-portal-wlr
  #       xdg-desktop-portal-gtk
  #     ];
  #   };
  # };

  # Enable flatpak and set paths
  services.flatpak.enable = true;
  environment.sessionVariables = rec {
    XDG_DATA_DIRS = [
      "/var/lib/flatpak/exports/share"
      "/home/remco/.local/share/flatpak/exports/share"
    ];
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Utilities
    # wayland-protocols
    # wayland-utils
    # wlroots
    # wl-clipboard
    # xdg-desktop-portal-hyprland

    # Encrypt folders 
    libsForQt5.plasma-vault

    # Theme
    rose-pine-gtk-theme
    rose-pine-icon-theme
    rose-pine-cursor

    # Making kdePacakages apps work
    # kdePackages.qtwayland
  ];

  # Setup theme
  environment.variables.GTK_THEME = "rose-pine-dawn";
  environment.variables.XCURSOR_THEME = "BreezeX-RosePineDawn-Linux";
  environment.variables.XCURSOR_SIZE = "24";

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    nerdfonts
    font-awesome
  ];

  # Enable numlock on boot, only necessary when having an UI.
  # TODO this seems to only enable the light...
  systemd.services.numLockOnTty = {
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      # /run/current-system/sw/bin/setleds -D +num < "$tty";
      ExecStart = lib.mkForce (pkgs.writeShellScript "numLockOnTty" ''
        for tty in /dev/tty{1..6}; do
            ${pkgs.kbd}/bin/setleds -D +num < "$tty";
        done
      '');
    };
  };

  # More UI-based programs
  programs.partition-manager.enable = true;

  programs.nm-applet.enable = true;

  # Enable KDE connect
  programs.kdeconnect.enable = true;

}
