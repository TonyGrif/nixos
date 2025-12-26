{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.desktopManagers;
in {
  options = {
    desktopManagers = {
      gnome = {
        enable = lib.mkEnableOption "Enable gnome module";
      };
    };
  };

  config = {
    services.xserver = lib.mkIf (cfg.gnome.enable) {
      enable = true;
      desktopManager.gnome.enable = true;
    };
  };
}
