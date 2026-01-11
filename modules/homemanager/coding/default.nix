{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.coding;
in {
  imports = [
    ./bash.nix
    ./fonts.nix
    ./jetbrains.nix
    ./vscode.nix
  ];

  options = {
    coding = {
      bash = {
        enable = lib.mkEnableOption "Enable bash";
        customization = lib.mkEnableOption "Enable bash prompt customizations";
      };
      fonts = lib.mkEnableOption "Enable coding fonts module";
      jetbrains = {
        idea = lib.mkEnableOption "Enable jetbrains intellij";
        pycharm = lib.mkEnableOption "Enable jetbrains pycharm";
      };
      vscode.enable = lib.mkEnableOption "Enable vscode";
      claude.enable = lib.mkEnableOption "Enable claude code";
    };
  };

  config = {
    bash = {
      enable = lib.mkIf (cfg.bash.enable) true;
      customization = lib.mkIf (cfg.bash.customization) true;
    };
    fonts.enable = lib.mkIf (cfg.fonts) true;
    jetbrains = {
      idea = lib.mkIf (cfg.jetbrains.idea) true;
      pycharm = lib.mkIf (cfg.jetbrains.pycharm) true;
    };
    vscode.enable = lib.mkIf (cfg.vscode.enable) true;

    home.packages = with pkgs;
      []
      ++ lib.optionals (cfg.claude.enable) [
        claude-code
      ];
  };
}
