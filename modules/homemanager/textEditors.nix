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
    };
  };

  config = {
    nixpkgs = {
      overlays = [
        outputs.overlays.unstable-packages
      ];
    };

    home.packages = with pkgs;
      []
      ++ lib.optionals (cfg.nvim.enable) [
        unstable.neovim
      ]
      ++ lib.optionals (cfg.nvim.pluginRequirements) [
        gcc
        ripgrep
      ]
      ++ lib.optionals (cfg.nvim.lspRequirements) [
        lua-language-server
        pyright
      ];
  };
}
