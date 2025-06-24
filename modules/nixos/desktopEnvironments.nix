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
    # TODO: Only enable x server if any desktop env is choosen
    services.xserver = lib.mkIf (cfg.gnome.enable) {
      enable = true;
      desktopManager.gnome.enable = lib.optionals (cfg.gnome.enable) true;
    };
  };
}
