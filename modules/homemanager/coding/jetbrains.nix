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
      idea = lib.mkEnableOption "Enable jetbrains intellij";
      pycharm = lib.mkEnableOption "Enable jetbrains pycharm";
    };
  };

  config = {
    home.packages = with pkgs;
      []
      ++ lib.optionals (cfg.idea) [
        jetbrains.idea-community
      ]
      ++ lib.optionals (cfg.pycharm) [
        jetbrains.pycharm-community
      ];
  };
}
