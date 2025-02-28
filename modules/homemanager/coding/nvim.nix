{
  outputs,
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.nvim;
in {
  options = {
    nvim = {
      enable = lib.mkEnableOption "Enable neovim and needed requirements";
      pluginRequirements = lib.mkEnableOption "Enable plugin requirements";
      lspRequirements = lib.mkEnableOption "Enable LSP requirements";
    };
  };

  config = lib.mkIf cfg.enable {
    nixpkgs = {
      overlays = [
        outputs.overlays.unstable-packages
      ];
    };

    home.packages = with pkgs;
      [
        unstable.neovim
      ]
      ++ lib.optionals (cfg.pluginRequirements) [
        gcc
        ripgrep
      ]
      ++ lib.optionals (cfg.lspRequirements) [
        gnumake
        cargo
        python3
        nodejs
        go
      ];
  };
}
