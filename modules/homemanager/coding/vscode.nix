{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.vscode;
in {
  options = {
    vscode = {
      enable = lib.mkEnableOption "Enable vscode fhs";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode.fhs;
    };
  };
}
