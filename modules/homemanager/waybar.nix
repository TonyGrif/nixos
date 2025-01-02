{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.waybar;
in {
  options = {
    waybar = {
      enable = lib.mkEnableOption "Enable waybar";
      experimental = lib.mkEnableOption "Enable experimental features when compiling";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages =
      if cfg.experimental
      then [
        (
          pkgs.waybar.overrideAttrs (oldAttrs: {
            mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
          })
        )
      ]
      else [pkgs.waybar];
  };
}
