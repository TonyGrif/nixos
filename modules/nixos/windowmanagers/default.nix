{
  lib,
  config,
  ...
}: let
  cfg = config.windowmanagers;
in {
  imports = [
    ./i3.nix
  ];

  options = {
    windowmanagers = {
      i3 = lib.mkEnableOption "Enable i3 module";
    };
  };

  config = {
    i3.enable = lib.mkIf (cfg.i3) true;
  };
}
