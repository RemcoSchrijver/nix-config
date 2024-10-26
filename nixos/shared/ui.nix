{ inputs
, lib
, config
, pkgs
, ...
}: {

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
    # Theme
    rose-pine-gtk-theme
    rose-pine-icon-theme
    rose-pine-cursor
  ];

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
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
