{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.windowManagers;
in {
  options = {
    windowManagers = {
      hyprland = {
        enable = lib.mkEnableOption "Enable hyprland module";
        kitty = lib.mkEnableOption "Enable kitty terminal";
        dolphin = lib.mkEnableOption "Enable dolphin file manager";
        wofi = lib.mkEnableOption "Enable wofi launcher";
      };
    };
  };

  config = lib.mkIf cfg.hyprland.enable {
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
      extraPortals = [
        pkgs.xdg-desktop-portal-hyprland
        pkgs.xdg-desktop-portal-gtk
      ];
      config = {
        # Hyprland can set different casings; match the common ones.
        "Hyprland".default = ["hyprland" "gtk"];
        hyprland.default = ["hyprland" "gtk"];
      };
    };

    environment.systemPackages = with pkgs;
      []
      ++ lib.optionals (cfg.hyprland.kitty) [
        kitty
      ]
      ++ lib.optionals (cfg.hyprland.dolphin) [
        kdePackages.dolphin
      ]
      ++ lib.optionals (cfg.hyprland.wofi) [
        wofi
      ];
  };
}
