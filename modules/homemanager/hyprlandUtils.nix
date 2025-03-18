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
    };
  };

  config = {
    home.packages = with pkgs;
      []
      ++ lib.optionals (cfg.swww.enable) [
        swww
      ];
  };
}
