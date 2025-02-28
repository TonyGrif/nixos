{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.jetbrains;
in {
  options = {
    jetbrains = {
      enable = lib.mkEnableOption "Enable jetbrains IDEs";
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      jetbrains.idea-community
    ];
  };
}
