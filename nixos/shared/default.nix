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
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Bash aliases
  programs.bash.shellAliases = {
    nix-build-desktop = "sudo nixos-rebuild switch --flake ~/nix-config#desktop";
    nix-build-laptop = "sudo nixos-rebuild switch --flake ~/nix-config#laptop";
    hm-switch = "home-manager switch --flake ~/nix-config#remco@nixos";
  };

  # Enable docker
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };
  # virtualisation.docker.rootless = {
  # enable = true;
  # setSocketVariable = true;
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Utilities
    tree-sitter
    fd
    ripgrep
    unzip
    gcc
    wget
    home-manager
    wireguard-tools
    # Clipboard for x server and playing nice with neovim.
    xclip

    # Applications
    git
    vim
    bitwarden-cli

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
  ];

  # Enable numlock on boot
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

}
