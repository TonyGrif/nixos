{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.i3;
in {
  options = {
    i3 = {
      enable = lib.mkEnableOption "Enable i3 module";
    };
  };

  config = lib.mkIf cfg.enable {
    services.xserver = {
      enable = true;

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [];
      };
    };
  };
}
