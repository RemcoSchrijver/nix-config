{ inputs
, lib
, config
, pkgs
, specialArgs
, ...
}: {
  imports =
    [ ] ++
    (if specialArgs.hasUI then [ ./ui.nix ] else [ ]) ++
    (if specialArgs.hasUI && specialArgs.hasKDE then [ ./kde.nix ] else [ ]) ++
    (if specialArgs.hasUI && specialArgs.hasHyprland then [ ./hyprland.nix ] else [ ]) ++
    (if specialArgs.hasBluetooth then [ ./bluetooth.nix ] else [ ]) ++
    (if specialArgs.hasGaming then [ ./gaming.nix ] else [ ]);

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
    nix-build-framework = "sudo nixos-rebuild switch --flake ~/nix-config#framework";
    hm-switch = "home-manager switch --flake ~/nix-config#remco@nixos";

    # Terminal aliases
    ":q" = "exit";
    "gs" = "git status";
    "ga" = "git fetch && git add -A";
  };

  # Enable docker
  virtualisation.docker = {
    enable = true;
  };

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
    pciutils
    usbutils

    # Applications
    git
    vim
    bitwarden-cli
    wireguard-tools
    tree-sitter
    btop

    # Languages used for dev.
    python3
    openjdk
    ruby

    # Runtime dependencies paradox launcher
    libnotify
    nss
    alsa-lib
  ];

  programs.ssh.startAgent = true;

  networking = {
    wireguard = {
      enable = true;
    };
    networkmanager = {
      enable = true;
    };
    # Allow wireguard through the firewall
    firewall = {
      enable = true;
      # if packets are still dropped, they will show up in dmesg
      logReversePathDrops = true;
      checkReversePath = "loose";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  security = {
    polkit.enable = true;
    rtkit.enable = true;
  };
}
