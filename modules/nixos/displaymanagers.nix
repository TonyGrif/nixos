{
  lib,
  config,
  ...
}: let
  cfg = config.displayManagers;
in {
  options = {
    displayManagers = {
      gdm.enable = lib.mkEnableOption "Enable gdm module";
      ly.enable = lib.mkEnableOption "Enable ly module";
    };
  };

  config = {
    services = {
      xserver = {
        enable = true;

        displayManager =  {
          gdm = lib.mkIf (cfg.gdm.enable) {
            enable = true;
          };
        };
      };

      displayManager = lib.mkIf (cfg.ly.enable) {
        ly.enable = true;
      };
    };
  };
}