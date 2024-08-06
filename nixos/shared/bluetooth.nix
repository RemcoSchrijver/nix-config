{ inputs
, lib
, config
, pkgs
, ...
}: {
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        FastConnectable = true;
      };
      Policy = {
        ReconnectAttempts = 7;
        ReconnectIntervals = "1, 2, 3";
      };
    };
  };
}
