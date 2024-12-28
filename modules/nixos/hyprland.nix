{
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    hyprland.enable = lib.mkEnableOption "Enable hyprland and other complimentary programs";
  };

  config = lib.mkIf config.hyprland.enable {
    nixpkgs = {
      overlays = [
        outputs.overlays.unstable-packages
      ];
    };

    programs.hyprland.enable = true;

    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
