{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    dolphin.enable = lib.mkEnableOption "Enable dolphin file manager";
  };

  config = lib.mkIf config.dolphin.enable {
    environment.systemPackages = with pkgs; [
      libsForQt5.dolphin
    ];
  };
}
