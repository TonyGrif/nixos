{
  lib,
  config,
  ...
}: let
  cfg = config.displaymanagers;
in {
  options = {
    displaymanagers = {
      gdm = lib.mkEnableOption "Enable gdm module";
    };
  };

  config = {
    services.xserver = lib.mkIf (cfg.gdm) {
      enable = true;

      displayManager = {
        gdm = {
          enable = true;
        };
      };
    };
  };
}
