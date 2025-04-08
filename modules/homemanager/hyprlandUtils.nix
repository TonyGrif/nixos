{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hyprlandUtils;
in {
  options = {
    hyprlandUtils = {
      swww.enable = lib.mkEnableOption "Enable swww wallpaper";
      waybar.enable = lib.mkEnableOption "Enable waybar";
    };
  };

  config = {
    home.packages = with pkgs;
      []
      ++ lib.optionals (cfg.swww.enable) [
        swww
      ] ++ lib.optionals (cfg.waybar.enable) [
        waybar
      ];
  };
}
