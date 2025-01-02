{
  lib,
  config,
  ...
}: let
  cfg = config.pipewire;
in {
  options = {
    pipewire = {
      enable = lib.mkEnableOption "Enable pipewire modules and settings";
    };
  };

  config = lib.mkIf cfg.enable {
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
