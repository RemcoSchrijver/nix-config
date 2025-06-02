{ inputs
, lib
, config
, pkgs
, ...
}: {
  services = {
    # Setup Nintendo controller support
    joycond.enable = true;
  };

  hardware = {
    steam-hardware.enable = true;
  };

  programs = {
    steam = {
      enable = true;
    };
    gamemode = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    dualsensectl
    openssl_1_1
  ];
}
