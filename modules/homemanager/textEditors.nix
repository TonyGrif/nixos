{
  outputs,
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.textEditors;
in {
  options = {
    textEditors = {
      nvim = {
        enable = lib.mkEnableOption "Enable neovim";
        pluginRequirements = lib.mkEnableOption "Enable plugin requirements";
        lspRequirements = lib.mkEnableOption "Enable LSP requirements";
      };
      vscode = {
        enable = lib.mkEnableOption "Enable vscode fhs";
      };
    };
  };

  config = {
    nixpkgs = {
      overlays = [
        outputs.overlays.unstable-packages
      ];
    };

    programs.vscode = lib.mkIf (cfg.vscode.enable) {
      enable = true;
      package = pkgs.vscode.fhs;
      # profiles.default.extensions = with pkgs.vscode-extensions [];
    };

    home.packages = with pkgs;
      []
      ++ lib.optionals (cfg.nvim.enable) [
        unstable.neovim
      ]
      ++ lib.optionals (cfg.nvim.enable && cfg.nvim.pluginRequirements) [
        gcc
        ripgrep
      ]
      ++ lib.optionals (cfg.nvim.enable && cfg.nvim.lspRequirements) [
        lua-language-server
        pyright
      ];
  };
}
