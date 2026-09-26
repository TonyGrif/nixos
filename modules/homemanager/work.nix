{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.work;
in {
  options = {
    work = {
      enable = lib.mkEnableOption "Enable work packages";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      slack
      teams-for-linux
    ];
  };
}
