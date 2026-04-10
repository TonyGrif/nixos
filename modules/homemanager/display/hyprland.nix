{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.hyprland;
in {
  options = {
    hyprland = {
      enable = lib.mkEnableOption "Enable hyprland home-manager module";
      monitors = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = ["DP-3, 3840x2160@144, 0x0, 1"];
        description = "Hyprland monitor configuration strings (name, resolution@hz, position, scale)";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      inputs.noctalia-shell.packages.${pkgs.system}.default
      pkgs.rofi
    ];

    xdg.portal = {
      enable = true;
      config.hyprland.default = ["hyprland" "gtk"];
    };

    wayland.windowManager.hyprland = {
      enable = true;
      package = null; # installed at system level via windowManagers.hyprland

      settings = {
        exec-once = [
          "noctalia"
        ];

        # Syntax: "name, resolution@hz, position, scale"
        monitor = cfg.monitors;

        input = {
          kb_layout = "us";
          follow_mouse = 1;
          touchpad = {
            natural_scroll = true;
          };
        };

        general = {
          gaps_in = 4;
          gaps_out = 8;
          border_size = 2;
          layout = "dwindle";
        };

        decoration = {
          rounding = 8;
          blur = {
            enabled = true;
            size = 6;
            passes = 2;
          };
        };

        animations = {
          enabled = true;
        };

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        "$mod" = "SUPER";

        bind = [
          # Launchers
          "$mod, Return, exec, kitty"
          "$mod, Space, exec, rofi -show drun"
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod, V, togglefloating"

          # Focus
          "$mod, H, movefocus, l"
          "$mod, L, movefocus, r"
          "$mod, K, movefocus, u"
          "$mod, J, movefocus, d"

          # Move windows
          "$mod SHIFT, H, movewindow, l"
          "$mod SHIFT, L, movewindow, r"
          "$mod SHIFT, K, movewindow, u"
          "$mod SHIFT, J, movewindow, d"

          # Workspaces
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"

          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"

          # Screenshot
          "$mod, P, exec, grimblast copy area"
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
      };
    };
  };
}
