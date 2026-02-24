{ config, lib, pkgs, ... }:

let
  cfg = config.java;
in
{
  options.java = {
    runtimes = lib.mkOption {
      type = lib.types.attrsOf lib.types.package;
      default = { };
      description = "Jave runtimes to expose as JAVA_<version>_HOME environment variables, a full list of installed runtimes can be found in NIX_JAVA_RUNTIMES.";
    };
  };

  config = lib.mkIf (cfg.runtimes != { }) {
    home.sessionVariables =
      (lib.mapAttrs'
        (version: pkg: lib.nameValuePair "JAVA_${version}_HOME" "${pkg}")
        cfg.runtimes)
      // {
        NIX_JAVA_RUNTIMES = lib.concatStringsSep "," (lib.attrNames cfg.runtimes);
      };
  };
}
