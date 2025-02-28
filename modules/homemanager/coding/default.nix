{
  lib,
  config,
  ...
}: let
  cfg = config.coding;
in {
  imports = [
    ./fonts.nix
    ./jetbrains.nix
    ./nvim.nix
  ];

  options = {
    coding = {
      fonts = lib.mkEnableOption "Enable coding fonts module";
      jetbrains = lib.mkEnableOption "Enable JetBrains IDEs";
      nvim = {
        enable = lib.mkEnableOption "Enable neovim module";
        pluginRequirements = lib.mkEnableOption "Enable plugin requirements";
        lspRequirements = lib.mkEnableOption "Enable lsp requirements";
      };
    };
  };

  config = {
    fonts.enable = lib.mkIf (cfg.fonts) true;
    jetbrains.enable = lib.mkIf (cfg.jetbrains) true;
    nvim = {
      enable = lib.mkIf (cfg.nvim.enable) true;
      pluginRequirements = lib.mkIf (cfg.nvim.pluginRequirements) true;
      lspRequirements = lib.mkIf (cfg.nvim.lspRequirements) true;
    };
  };
}
