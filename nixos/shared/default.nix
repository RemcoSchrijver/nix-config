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

  # Enable docker
  virtualisation.docker.enable = true;
  virtualisation.docker.enableNvidia = true;
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


  programs.ssh.startAgent = true;

  programs.partition-manager.enable = true;

}
