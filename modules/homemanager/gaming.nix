{
  lib,
  config,
  pkgs,
  ...
}: let
  emulationCfg = config.emulation;
in {
  options = {
    emulation = {
      enable = lib.mkEnableOption "Enable emulation packages";
    };
  };

  config = {
    home.packages = with pkgs;
      []
      ++ lib.optionals emulationCfg.enable [
        (retroarch.withCores (cores:
          with cores; [
            sameboy # Gameboy
          ]))
        rpcs3
      ];
  };
}
