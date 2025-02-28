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
      nvim = lib.mkEnableOption "Enable neovim module";
    };
  };

  config = {
    fonts.enable = lib.mkIf (cfg.fonts) true;
    jetbrains.enable = lib.mkIf (cfg.jetbrains) true;
    nvim.enable = lib.mkIf (cfg.nvim) true;
  };
}
