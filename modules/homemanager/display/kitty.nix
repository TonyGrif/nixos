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
      fontType = lib.mkOption {
        type = lib.types.str;
        default = "monospace";
        description = "Font family for kitty terminal";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.kitty = {
      enable = true;

      settings = {
        font_family = "family=\"${cfg.fontType}\"";
        font_size = cfg.fontSize;

        scrollback_lines = 5000;

        # Kitty saves and restores its last window state, including
        # "maximized". Hyprland marks tiled windows as maximized, so kitty
        # sends set_maximized() at startup and covers the other tiles.
        remember_window_size = false;

        enable_audio_bell = false;
      };
    };
  };
}
