# TODO: Add option for config
{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.hyprpaper;
in {
  options = {
    hyprpaper = {
      enable = lib.mkEnableOption "Enable hyprpaper wallpaper utility";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      hyprpaper
    ];
  };
}
