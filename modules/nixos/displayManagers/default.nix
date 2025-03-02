{
  lib,
  config,
  ...
}: let
  cfg = config.displaymanagers;
in {
  imports = [
    ./gdm.nix
    ./ly.nix
  ];

  options = {
    displaymanagers = {
      gdm.enable = lib.mkEnableOption "Enable gdm module";
      ly.enable = lib.mkEnableOption "Enable ly module";
    };
  };

  config = {
    gdm.enable = lib.mkIf (cfg.gdm.enable);
    ly.enable = lib.mkIf (cfg.ly.enable);
  };
}
