{
  lib,
  config,
  ...
}: let
  cfg = config.gdm;
in {
  options = {
    gdm = {
      enable = lib.mkEnableOption "Enable gdm display manager";
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;

      displayManager = {
        gdm = {
          enable = true;
        };
      };
    };
  };
}
