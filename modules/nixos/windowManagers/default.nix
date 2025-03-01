{
  lib,
  config,
  ...
}: let
  cfg = config.windowManagers;
in {
  options = {
    windowManagers = {
      qtile = lib.mkEnableOption "Enable qtile";
    };
  };

  config = {
    services.xserver = {
      enable = true;

      windowManager = {
        qtile = lib.optionals (cfg.qtile) {
          enable = true;
        };
      };
    };
  };
}
