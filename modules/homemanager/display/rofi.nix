{
  config,
  lib,
  ...
}: let
  cfg = config.rofi;
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  options = {
    rofi = {
      enable = lib.mkEnableOption "Enable rofi launcher home-manager module";
      fontSize = lib.mkOption {
        type = lib.types.int;
        default = 14;
        description = "Font size for rofi";
      };
      fontType = lib.mkOption {
        type = lib.types.str;
        default = "monospace";
        description = "Font family for rofi";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    programs.rofi = {
      enable = true;
      font = "${cfg.fontType} ${toString cfg.fontSize}";
      terminal = lib.mkIf config.kitty.enable "kitty";
      location = "center";
      cycle = true;
      modes = ["drun" "run" "window"];

      extraConfig = {
        show-icons = true;
        drun-display-format = "{name}";
        display-drun = "Apps";
        display-run = "Run";
        display-window = "Windows";
        matching = "fuzzy";
        # Leave sorting off: rofi then keeps its launch-history order
        # (~/.cache/rofi3.druncache) for matches, so frequently used apps
        # rank first. sort/fzf re-ranks purely by match quality.
        sort = false;

        # Vim-style navigation. Rofi rejects duplicate bindings, so Ctrl+j/k
        # are first removed from their defaults (accept-entry, remove-to-eol).
        kb-row-up = "Up,Control+k,Control+p";
        kb-row-down = "Down,Control+j,Control+n";
        kb-accept-entry = "Return,KP_Enter";
        kb-remove-to-eol = "";
      };

      theme = {
        "*" = {
          bg = mkLiteral "#1e1e2e";
          bg-alt = mkLiteral "#313244";
          fg = mkLiteral "#cdd6f4";
          fg-dim = mkLiteral "#7f849c";
          accent = mkLiteral "#89b4fa";

          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@fg";
          margin = 0;
          padding = 0;
          spacing = 0;
        };

        window = {
          width = mkLiteral "40%";
          background-color = mkLiteral "@bg";
          border = mkLiteral "3px";
          border-color = mkLiteral "@accent";
          border-radius = mkLiteral "8px";
        };

        mainbox = {
          padding = mkLiteral "12px";
          spacing = mkLiteral "8px";
          children = map mkLiteral ["inputbar" "message" "listview" "mode-switcher"];
        };

        inputbar = {
          padding = mkLiteral "8px 12px";
          spacing = mkLiteral "8px";
          background-color = mkLiteral "@bg-alt";
          border-radius = mkLiteral "6px";
          children = map mkLiteral ["prompt" "entry"];
        };

        prompt.text-color = mkLiteral "@accent";

        entry = {
          placeholder = "Search";
          placeholder-color = mkLiteral "@fg-dim";
        };

        message = {
          padding = mkLiteral "8px 12px";
          background-color = mkLiteral "@bg-alt";
          border-radius = mkLiteral "6px";
        };

        listview = {
          lines = 10;
          columns = 1;
          fixed-height = true;
          scrollbar = false;
          spacing = mkLiteral "2px";
        };

        element = {
          padding = mkLiteral "6px 12px";
          spacing = mkLiteral "10px";
          border-radius = mkLiteral "6px";
        };

        "element selected.normal" = {
          background-color = mkLiteral "@accent";
          text-color = mkLiteral "@bg";
        };

        element-icon.size = mkLiteral "1.2em";

        element-text = {
          text-color = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
        };

        mode-switcher.spacing = mkLiteral "8px";

        button = {
          padding = mkLiteral "6px";
          border-radius = mkLiteral "6px";
          background-color = mkLiteral "@bg-alt";
          text-color = mkLiteral "@fg-dim";
        };

        "button selected" = {
          background-color = mkLiteral "@accent";
          text-color = mkLiteral "@bg";
        };
      };
    };
  };
}
