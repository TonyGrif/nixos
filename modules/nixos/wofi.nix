{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    wofi.enable = lib.mkEnableOption "Enable wofi menu launcher";
  };

  config = lib.mkIf config.wofi.enable {
    environment.systemPackages = with pkgs; [
      wofi
    ];
  };
}
