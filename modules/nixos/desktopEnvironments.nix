{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.desktopEnvironments;
in {
  options = {
    desktopEnvironments = {
      gnome = {
        enable = lib.mkEnableOption "Enable gnome module";
      };
    };
  };

  config = {
    services.xserver = {
      enable = true;
      desktopManager.gnome.enable = lib.optionals (cfg.gnome.enable) true;
    };
  };
}
