{ inputs
, lib
, config
, pkgs
, specialArgs
, ...
}: {
  imports = 
    [
      (if specialArgs.hasUI then ./ui.nix else "")
    ];
  
  # Enable flatpak and set paths
  services.flatpak.enable = true;
  environment.sessionVariables = rec {
    XDG_DATA_DIRS = [
      "/var/lib/flatpak/exports/share"
      "/home/remco/.local/share/flatpak/exports/share"
    ];
  };

  # Garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 60d";
  };

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
    dconf
    fd
    gcc
    home-manager
    ripgrep
    smartmontools
    unzip
    usbutils

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
  ];

  programs.ssh.startAgent = true;

  services.resolved.enable = true;
  networking = {
    wireguard = {
      enable = true;
    };
    networkmanager = {
      enable = true;
    };
    # Allow wireguard through the firewall
    firewall = {
      # if packets are still dropped, they will show up in dmesg
      logReversePathDrops = true;
      checkReversePath = "loose";
      # wireguard trips rpfilter up
      # extraCommands = ''
      #   ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --sport 63941 -j RETURN
      #   ip46tables -t mangle -I nixos-fw-rpfilter -p udp -m udp --dport 63941 -j RETURN
      # '';
      # extraStopCommands = ''
      #   ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --sport 63941 -j RETURN || true
      #   ip46tables -t mangle -D nixos-fw-rpfilter -p udp -m udp --dport 63941 -j RETURN || true
      # '';
    };
  };

  security.polkit.enable = true;

}
