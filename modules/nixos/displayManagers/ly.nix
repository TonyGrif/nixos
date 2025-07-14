{
  lib,
  config,
  ...
}: let
  cfg = config.ly;
in {
  options = {
    ly = {
      enable = lib.mkEnableOption "Enable ly module";
    };
  };

  config = lib.mkIf (cfg.enable) {
    services = {
      displayManager = {
        ly.enable = true;
      };
    };
  };
}
