{
  outputs,
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.hyprland;
in {
  imports = [
    ./dolphin.nix
    ./wofi.nix
  ];

  options = {
    hyprland = {
      enable = lib.mkEnableOption "Enable hyprland module";
      dolphin = lib.mkEnableOption "Enable dolphin file manager";
      wofi = lib.mkEnableOption "Enable wofi launcher";
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

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

    dolphin.enable = lib.mkIf (cfg.dolphin) true;
    wofi.enable = lib.mkIf (cfg.wofi) true;

    environment.systemPackages = with pkgs; [
      kitty
    ];
  };
}
