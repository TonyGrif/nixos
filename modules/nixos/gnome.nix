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
