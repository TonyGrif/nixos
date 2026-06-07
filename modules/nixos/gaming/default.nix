{
  lib,
  config,
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
    };
  };

  config = {
    programs.steam = lib.mkIf cfg.steam.enable {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    hardware.xone.enable = cfg.controllers.xone.enable;
    hardware.xpadneo.enable = cfg.controllers.xone.enable;
  };
}
