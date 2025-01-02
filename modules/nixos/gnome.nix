{
  lib,
  config,
  ...
}: let
  cfg = config.gnome;
in {
  options = {
    gnome = {
      enable = lib.mkEnableOption "Enable gnome module";
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;

      displayManager = {
        gdm = {
          enable = true;
          autoSuspend = false;
        };
      };

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
  };
}
