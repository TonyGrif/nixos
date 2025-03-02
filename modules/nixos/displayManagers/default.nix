{
  lib,
  config,
  ...
}: let
  cfg = config.displayManagers;
in {
  imports = [
    ./gdm.nix
    ./ly.nix
  ];

  options = {
    displayManagers = {
      gdm.enable = lib.mkEnableOption "Enable gdm module";
      ly.enable = lib.mkEnableOption "Enable ly module";
    };
  };

  config = {
    gdm.enable = lib.mkIf (cfg.gdm.enable) true;
    ly.enable = lib.mkIf (cfg.ly.enable) true;
  };
}
