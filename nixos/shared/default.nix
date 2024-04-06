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

  programs.hyprland = {
    enable = true;
  };


  # Enable screen sharing on wayland
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
      gtkUsePortal = true;
    };
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Fix neovim plugins for Mason not working
  programs.nix-ld.enable = true;

  # Bash aliases
  programs.bash.shellAliases = {
    # Aliases for building nix configs
    nix-build-desktop = "sudo nixos-rebuild switch --flake ~/nix-config#desktop";
    nix-build-laptop = "sudo nixos-rebuild switch --flake ~/nix-config#laptop";
    nix-build-thinkpad = "sudo nixos-rebuild switch --flake ~/nix-config#thinkpad";
    hm-switch = "home-manager switch --flake ~/nix-config#remco@nixos";

    # Terminal aliases
    ":q" = "exit";
    "gs" = "git status";
    "ga" = "git fetch && git add -A";
  };

  # Enable docker
  virtualisation.docker = {
    enable = true;
    # TODO make nvidia an option, not doing that rn.
    #enableNvidia = true;
  };
  # virtualisation.docker.rootless = {
  # enable = true;
  # setSocketVariable = true;
  # };

  # udev rules for controllers
  services.udev.extraRules = ''
    KERNEL=="hidraw*", ATTRS{idVendor}=="057e", ATTRS{idProduct}=="2009", TAG+="uaccess"
  '';

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Utilities
    fd
    ripgrep
    unzip
    gcc
    wget
    home-manager
    dconf
    xdg-desktop-portal-hyprland
    wl-clipboard
    wayland-utils
    wayland-protocols
    wlroots

    # Applications
    git
    vim
    bitwarden-cli
    wireguard-tools
    tree-sitter

    # Languages used for dev.
    python3
    openjdk
    ruby

    # Runtime dependencies paradox launcher
    libnotify
    nss
    alsa-lib

    # Probably a .net core 3.1 dependency
    openssl_1_1

    # Encrypt folders 
    libsForQt5.plasma-vault

    # Theme
    rose-pine-gtk-theme
    rose-pine-icon-theme
    rose-pine-cursor

    # Making kdePacakages apps work
    kdePackages.qtwayland
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

  # Enable numlock on boot
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


  programs.ssh.startAgent = true;

  programs.partition-manager.enable = true;

  networking.networkmanager = {
    enable = true;
  };

  programs.nm-applet.enable = true;
  security.polkit.enable = true;

}
