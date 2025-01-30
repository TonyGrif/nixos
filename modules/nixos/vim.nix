{
  lib,
  config,
  ...
}: let
  cfg = config.vim;
in {
  options = {
    vim = {
      enable = lib.mkEnableOption "Enable vim module";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.vim = {
      enable = true;
      defaultEditor = true;
    };
  };
}
