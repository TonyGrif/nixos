{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.office;
in {
  options = {
    office = {
      libreoffice.enable = lib.mkEnableOption "Enable libreoffice suite";
    };
  };

  config = {
    home.packages = with pkgs;
      []
      ++ lib.optionals (cfg.libreoffice.enable) [
        libreoffice-fresh
      ];
  };
}
