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
      enable = lib.mkEnableOption "Enable gaming services";
      amd = lib.mkEnableOption "Enable amd drivers";
    };
  };

  config = lib.mkIf (cfg.enable) {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = lib.mkIf (cfg.amd) ["amdgpu"];

    programs.steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    programs.gamemode.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
    ];
  };
}
