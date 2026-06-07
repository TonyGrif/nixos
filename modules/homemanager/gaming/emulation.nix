{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.emulation;
in {
  options = {
    emulation = {
      enable = lib.mkEnableOption "Enable emulation packages";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      (retroarch.withCores (cores:
        with cores; [
          sameboy # Gameboy
        ]))
      rpcs3
    ];
  };
}
