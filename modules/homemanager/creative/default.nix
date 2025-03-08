{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.creative;
in {
  options = {
    creative = {
      pixelArt.enable = lib.mkEnableOption "Enable pixel art tools";
    };
  };

  config = {
    home.packages = with pkgs;
      []
      ++ lib.optionals (cfg.pixelArt.enable) [
        libresprite
      ];
  };
}
