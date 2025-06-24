{
  lib,
  config,
  ...
}: let
  cfg = config.displayManagers;
in {
  options = {
    displayManagers = {
      gdm = {
        enable = lib.mkEnableOption "Enable gdm module";
        suspend = lib.mkOption {
          type = with lib.types; bool;
          description = "Determine if gdm will auto suspend on inactivity";
          default = true;
        };
      };
      ly.enable = lib.mkEnableOption "Enable ly module";
    };
  };

  config = {
    services = {
      xserver = lib.mkIf (cfg.gdm.enable) {
        enable = true;

        displayManager = {
          gdm = lib.mkIf (cfg.gdm.enable) {
            enable = true;
            autoSuspend = cfg.gdm.suspend;
          };
        };
      };

      displayManager = lib.mkIf (cfg.ly.enable) {
        ly.enable = true;
      };
    };
  };
}
