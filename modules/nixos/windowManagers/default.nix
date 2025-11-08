{
  lib,
  config,
  ...
}: let
  cfg = config.windowMangers;
in {
  imports = [
    ./i3.nix
    ./hyprland.nix
  ];

  options = {
    windowMangers = {
      i3.enable = lib.mkEnableOption "Enable i3 window manager";
      hyprland = {
        enable = lib.mkEnableOption "Enable hyprland window manager";
        kitty = lib.mkEnableOption "Enable kitty terminal";
        dolphin = lib.mkEnableOption "Enable dolphin file manager";
        wofi = lib.mkEnableOption "Enable wofi launcher";
      };
    };
  };

  config = {
    i3 = lib.mkIf (cfg.i3.enable) {
      enable = true;
    };
    hyprland = lib.mkIf (cfg.hyprland.enable) {
      enable = true;
      kitty = lib.mkIf (cfg.hyprland.kitty) true;
      dolphin = lib.mkIf (cfg.hyprland.dolphin) true;
      wofi = lib.mkIf (cfg.hyprland.wofi) true;
    };
  };
}
