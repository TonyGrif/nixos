{
  outputs,
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.hyprland;
in{
  imports = [
    ./dolphin.nix
    ./waybar.nix
  ];

  options = {
    hyprland = {
      enable = lib.mkEnableOption "Enable hyprland";
      dolphin = lib.mkEnableOption "Enable dolphin";
    };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs = {
      overlays = [
        outputs.overlays.unstable-packages
      ];
    };

    programs.hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    environment.sessionVariables = {
      NIXOS_OZONE_WL = "1";
    };
    hardware = {
      graphics.enable = true;
    };

    dolphin.enable = lib.mkIf (cfg.dolphin) true;

    waybar = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
