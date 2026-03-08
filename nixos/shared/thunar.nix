{ inputs
, lib
, config
, pkgs
, ...
}: {
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-archive-plugin
      thunar-media-tags-plugin
      thunar-vcs-plugin
      thunar-volman
    ];
  };

  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
