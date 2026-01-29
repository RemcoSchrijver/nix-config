{ config, pkgs, theme, ... }:

{
  home.packages = with pkgs; [
    kdePackages.kdenlive

    # Plugins
    cmt
    ladspaPlugins

    # Extra fonts
    vista-fonts
    corefonts

    # Some stuff for auto subtitles
    openai-whisper
    python313Packages.srt
    python313Packages.torch
    python313Packages.openai-whisper
  ];
}
