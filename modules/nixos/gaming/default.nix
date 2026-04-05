{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.gaming;
in {
  options = {
    gaming = {
      emulation = {
        retroarch = {
          enable = lib.mkEnableOption "Enable retroarch";
        };
      };
    };
  };

  config = {
    environment.systemPackages = with pkgs;
      []
      ++ lib.optionals (cfg.emulation.retroarch.enable) [
        (retroarch.withCores (cores:
          with cores; [
            sameboy # Gameboy
          ]))
      ];
  };
}
