{
  lib,
  config,
  ...
}: let
  cfg = config.gnome;
in {
  imports = [
    ./displaymanager/gdm.nix
  ];

  options = {
    gnome = {
      enable = lib.mkEnableOption "Enable gnome module";
      gdm = lib.mkEnableOption "Enable gdm display manager";
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

    gdm.enable = lib.mkIf (cfg.gdm) true;
  };
}
