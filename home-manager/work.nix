{ inputs, lib, config, pkgs, ... }: {

  home = {
    username = "rschrijver";
    homeDirectory = "/home/rschrijver";
  };

  imports = [
    ./apps/direnv.nix
    ./apps/terminal.nix
    ./apps/tmux/tmux.nix
    ./apps/nvim/nvim.nix
    ./compositors/i3
  ];

  # Enable XDG packages so we can use existing dotfiles.
  xdg.enable = true;

  # Enable home-manager and git
  programs.home-manager.enable = true;

  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
