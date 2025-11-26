{
  lib,
  config,
  ...
}: let
  cfg = config.gdm;
in {
  options = {
    gdm = {
      enable = lib.mkEnableOption "Enable gdm module";
      suspend = lib.mkOption {
        type = lib.types.bool;
        description = "Determine if gdm will auto suspend on inactivity";
        default = true;
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    services = {
      xserver = {
        enable = true;

        displayManager = {
          gdm = {
            enable = true;
            wayland = true;
            autoSuspend = cfg.suspend;
          };
        };
      };
    };
  };
}
