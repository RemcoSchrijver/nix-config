{ config, lib, pkgs, inputs, ... }:

let
  cfg = config.java;

  lombokJarFile = pkgs.fetchurl {
    url = "https://repo1.maven.org/maven2/org/projectlombok/lombok/1.18.46/lombok-1.18.46.jar";
    hash = "sha256-AfexoBXjPiti1fXzcFMwY1erFBX9GB/Lp3lPXRmMESY=";
  };
in
{
  options.java = {
    runtimes = lib.mkOption {
      type = lib.types.attrsOf lib.types.package;
      default = { };
      description = "Java runtimes to expose as JAVA_<version>_HOME environment variables, a full list of installed runtimes can be found in NIX_JAVA_RUNTIMES.";
    };
  };

  config = lib.mkIf (cfg.runtimes != { }) {

    home.sessionVariables =
      (lib.mapAttrs'
        (version: pkg: lib.nameValuePair "JAVA_${version}_HOME" "${pkg}")
        cfg.runtimes)
      // {
        NIX_JAVA_RUNTIMES = lib.concatStringsSep "," (lib.attrNames cfg.runtimes);
        NIX_LOMBOK = "${lombokJarFile}";
      };
  };
}
