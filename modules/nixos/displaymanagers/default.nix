{
  lib,
  config,
  ...
}: let
  cfg = config.displaymanagers;
in {
  imports = [
    ./gdm.nix
  ];

  options = {
    displaymanagers = {
      gdm = lib.mkEnableOption "Enable gdm module";
    };
  };

  config = {
    gdm.enable = lib.mkIf (cfg.gdm) true;
  };
}
