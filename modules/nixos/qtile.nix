{
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    qtile.enable = lib.mkEnableOption "Enable Qtile and other complimentary programs";
  };

  config = lib.mkIf config.qtile.enable {
    nixpkgs = {
      overlays = [
        outputs.overlays.unstable-packages
      ];
    };

    services.xserver.windowManager.qtile = {
      enable = true;
      extraPackages = python3Packages: with python3Packages; [];
    };

    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
