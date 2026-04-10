{
  config,
  lib,
  ...
}: let
  cfg = config.kitty;
in {
  options = {
    kitty = {
      enable = lib.mkEnableOption "Enable kitty terminal home-manager module";
      fontSize = lib.mkOption {
        type = lib.types.int;
        default = 14;
        description = "Font size for kitty terminal";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      settings = {
        font_family = "monospace";
        font_size = cfg.fontSize;

        scrollback_lines = 5000;

        enable_audio_bell = false;
      };
    };
  };
}
