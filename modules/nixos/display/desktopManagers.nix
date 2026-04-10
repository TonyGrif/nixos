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

    xdg.portal = lib.mkIf (cfg.gnome.enable) {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gnome];
      configPackages = [pkgs.gnome-session];
    };

    environment.systemPackages = with pkgs;
      []
      ++ lib.optionals (cfg.gnome.enable) [
        xdg-desktop-portal-gnome # Wayland screen sharing
      ];
  };
}
