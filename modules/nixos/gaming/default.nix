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
    };
  };

  config = {
    programs.steam = lib.mkIf cfg.steam.enable {
      enable = true;
      remotePlay.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    # Games query the compositor for available modes, and Hyprland's monitor
    # scale reports a downscaled logical resolution (e.g. 1080p on a scaled
    # 4k output), so games only ever see that ceiling. gamescope runs a nested
    # compositor that presents a real native-resolution virtual display to
    # whatever runs inside it, sidestepping the scaling entirely. Add
    # `gamescope -W 3840 -H 2160 -r 144 -- %command%` as a per-game Steam
    # launch option to use it.
    environment.systemPackages = lib.mkIf cfg.steam.enable [pkgs.gamescope];

    hardware.xone.enable = cfg.controllers.xone.enable;
    hardware.xpadneo.enable = cfg.controllers.xone.enable;
  };
}
