{ inputs
, lib
, config
, pkgs
, ...
}: {
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.xserver.enable = true;

  programs.hyprland.enable = true;

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

  # Setup rose-pine-dawn theme.
  environment.variables.GTK_THEME = "rose-pine-dawn";
  environment.variables.XCURSOR_THEME = "BreezeX-RosePineDawn-Linux";
  environment.variables.XCURSOR_SIZE = "24";

  environment.systemPackages = with pkgs; [
    # Utilities
    wayland-protocols
    wayland-utils
    wlroots
    wl-clipboard
    xdg-desktop-portal-hyprland
    kdePackages.kwallet

    # Making kdePacakages apps work
    kdePackages.qtwayland
  ];
}
