{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.hyprland;
in {
  options = {
    hyprland = {
      enable = lib.mkEnableOption "Enable hyprland module";
      kitty = lib.mkEnableOption "Enable kitty terminal";
      dolphin = lib.mkEnableOption "Enable dolphin file manager";
      wofi = lib.mkEnableOption "Enable wofi launcher";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    hardware = {
      graphics.enable = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [pkgs.xdg-desktop-portal-gtk];
    };

    environment.systemPackages = with pkgs;
      []
      ++ lib.optionals (cfg.kitty) [
        kitty
      ]
      ++ lib.optionals (cfg.dolphin) [
        libsForQt5.dolphin
      ]
      ++ lib.optionals (cfg.wofi) [
        wofi
      ];
  };
}
