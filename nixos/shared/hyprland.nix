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
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    # Utilities
    wayland-protocols
    wayland-utils
    wlroots
    wl-clipboard
    xdg-desktop-portal-hyprland

    # Making kdePacakages apps work
    kdePackages.qtwayland
}
