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
    services.desktopManager.gnome = lib.mkIf (cfg.gnome.enable) {
      enable = true;
    };
  };
}
