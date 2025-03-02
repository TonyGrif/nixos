{
  lib,
  config,
  ...
}: let
  cfg = config.qtile;
in {
  options = {
    qtile = {
      enable = lib.mkEnableOption "Enable qtile module";
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;

      windowManager = {
        qtile = {
          enable = true;
        };
      };
    };
  };
}
