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
      enable = lib.mkEnableOption "Enable vscode";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        dracula-theme.theme-dracula
        vscodevim.vim
      ];
      mutableExtensionsDir = false;
      userSettings = {
        "workbench.colorTheme" = "Dracula";
        "vim.vimrc.enable" = true;
        "vim.vimrc.path" = "$HOME/nixos/modules/homemanager/vscode/vimrc";
      };
    };
  };
}
