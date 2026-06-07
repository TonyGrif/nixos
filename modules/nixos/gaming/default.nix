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
      steam.enable = lib.mkEnableOption "Enable Steam";
      controllers = {
        xone.enable = lib.mkEnableOption "Enable Xbox controller support";
      };
      emulation = {
        retroarch = {
          enable = lib.mkEnableOption "Enable retroarch";
        };
      };
    };
  };

  config = {
    programs.steam = lib.mkIf cfg.steam.enable {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    environment.systemPackages = with pkgs;
      []
      ++ lib.optionals (cfg.emulation.retroarch.enable) [
        (retroarch.withCores (cores:
          with cores; [
            sameboy # Gameboy
          ]))
      ];

    hardware.xone.enable = cfg.controllers.xone.enable;
    hardware.xpadneo.enable = cfg.controllers.xone.enable;
  };
}
