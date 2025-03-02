{
  lib,
  config,
  ...
}: let
  cfg = config.windowManagers;
in {
  imports = [
    ./qtile.nix
    ./hyprland.nix
  ];

  options = {
    windowManagers = {
      qtile.enable = lib.mkEnableOption "Enable qtile module";
      hyprland = {
        enable = lib.mkEnableOption "Enable hyprland module";
        kitty = lib.mkEnableOption "Enable kitty terminal";
        dolphin = lib.mkEnableOption "Enable dolphin file manager";
        wofi = lib.mkEnableOption "Enable wofi application launcher";
      };
    };
  };

  config = {
    qtile.enable = lib.mkIf (cfg.qtile.enable) true;
    hyprland = {
      enable = lib.mkIf (cfg.hyprland.enable) true;
      kitty = lib.mkIf (cfg.hyprland.kitty) true;
      dolphin = lib.mkIf (cfg.hyprland.dolphin) true;
      wofi = lib.mkIf (cfg.hyprland.wofi) true;
    };
  };
}
