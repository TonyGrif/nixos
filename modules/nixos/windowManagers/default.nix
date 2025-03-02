{
  lib,
  config,
  ...
}: let
  cfg = config.windowManagers;
in {
  imports = [
    ./qtile.nix
  ];

  options = {
    windowManagers = {
      qtile = lib.mkEnableOption "Enable qtile module";
    };
  };

  config = {
    qtile.enable = lib.mkIf (cfg.qtile) true;
  };
}
