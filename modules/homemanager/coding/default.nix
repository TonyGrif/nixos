{
  lib,
  config,
  ...
}: let
  cfg = config.coding;
in {
  imports = [
    ./bash.nix
    ./fonts.nix
    ./jetbrains.nix
    ./nvim.nix
  ];

  options = {
    coding = {
      bash = {
        enable = lib.mkEnableOption "Enable bash";
        customization = lib.mkEnableOption "Enable bash prompt customizations";
      };
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
    bash = {
      enable = lib.mkIf (cfg.bash.enable) true;
      customization = lib.mkIf (cfg.bash.customization) true;
    };
    fonts.enable = lib.mkIf (cfg.fonts) true;
    jetbrains.enable = lib.mkIf (cfg.jetbrains) true;
    nvim = {
      enable = lib.mkIf (cfg.nvim.enable) true;
      pluginRequirements = lib.mkIf (cfg.nvim.pluginRequirements) true;
      lspRequirements = lib.mkIf (cfg.nvim.lspRequirements) true;
    };
  };
}
