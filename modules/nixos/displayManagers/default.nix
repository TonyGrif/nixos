{
  lib,
  config,
  ...
}: let
  cfg = config.displayManagers;
in {
  imports = [
    ./gdm.nix
    ./ly.nix
  ];

  options = {
    displayManagers = {
      gdm = {
        enable = lib.mkEnableOption "Enable gdm module";
        suspend = lib.mkOption {
          type = lib.types.bool;
          description = "Determine if gdm will auto suspend on inactivity";
          default = true;
        };
      };
      ly.enable = lib.mkEnableOption "Enable ly module";
    };
  };

  config = {
    gdm = {
      enable = cfg.gdm.enable;
      suspend = cfg.gdm.suspend;
    };
    ly.enable = cfg.ly.enable;
  };
}
