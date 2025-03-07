{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.gnome;
in {
  options = {
    gnome = {
      enable = lib.mkEnableOption "Enable gnome module";
      windowManager.enable = lib.mkEnableOption "Download window manager plugins for configuration in home manager";
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;

      desktopManager = {
        xterm.enable = false;
        gnome = {
          enable = true;
        };
      };

      xkb = {
        layout = "us";
        variant = "";
      };
    };

    environment.systemPackages = with pkgs.gnomeExtensions;
      []
      ++ lib.optionals (cfg.windowManager.enable) [
        space-bar
        forge
      ];
  };
}
