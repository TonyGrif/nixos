{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.hyprland;
  noctalia = inputs.noctalia-shell.packages.${pkgs.stdenv.hostPlatform.system}.default;
  noctaliaCmd = lib.getExe noctalia;
  wpctl = lib.getExe' pkgs.wireplumber "wpctl";
  playerctl = lib.getExe pkgs.playerctl;
  wallpaperDir = "${config.home.homeDirectory}/Pictures/Wallpapers";
in {
  imports = [
    inputs.noctalia-shell.homeModules.default
  ];

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
    # Portals are configured at the NixOS (system) level for both GNOME and Hyprland.
    # Disable HM's portal module to avoid duplicate user portal configuration/warnings.
    xdg.portal.enable = lib.mkForce false;

    programs.noctalia = {
      enable = true;
      systemd.enable = false;

      settings = {
        appLauncher = {
          overviewLayer = true;
        };
        bar = {
          displayMode = "always_visible";
          position = "top";
        };
        wallpaper = {
          enabled = true;
          directory = wallpaperDir;
        };
      };
    };

    home.activation.createNoctaliaWallpaperDir = lib.hm.dag.entryAfter ["writeBoundary"] ''
      mkdir -p ${lib.escapeShellArg wallpaperDir}
    '';

    wayland.windowManager.hyprland = {
      enable = true;
      configType = "hyprlang";
      package = null; # installed at system level via windowManagers.hyprland

      settings = {
        exec-once = [
          noctaliaCmd
        ];

        monitor = cfg.monitors;

        input = {
          kb_layout = "us";
          follow_mouse = 1;
          touchpad = {
            natural_scroll = true;
          };
        };

        cursor = {
          inactive_timeout = 5;
        };

        general = {
          gaps_in = 4;
          gaps_out = 8;
          border_size = 3;
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
          preserve_split = true;
        };

        "$mod" = "SUPER";

        bind = [
          # Launchers
          "$mod, Space, exec, kitty"
          "$mod, D, exec, ${noctaliaCmd} msg panel-toggle launcher"
          "$mod SHIFT, S, exec, ${noctaliaCmd} msg settings-toggle"
          "$mod, C, exec, ${noctaliaCmd} msg panel-toggle control-center home"
          "$mod, N, exec, ${noctaliaCmd} msg panel-toggle control-center notifications"
          "$mod, M, exec, ${noctaliaCmd} msg panel-toggle session"
          "$mod, W, exec, ${noctaliaCmd} msg panel-toggle wallpaper"
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

          # Resize windows
          "$mod CTRL, H, resizeactive, -40 0"
          "$mod CTRL, L, resizeactive, 40 0"
          "$mod CTRL, K, resizeactive, 0 -40"
          "$mod CTRL, J, resizeactive, 0 40"

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

        bindel = [
          # Audio
          ", XF86AudioRaiseVolume, exec, ${wpctl} set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
          ", XF86AudioLowerVolume, exec, ${wpctl} set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ];

        bindl = [
          # Audio
          ", XF86AudioMute, exec, ${wpctl} set-mute @DEFAULT_AUDIO_SINK@ toggle"
          ", XF86AudioMicMute, exec, ${wpctl} set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
          ", XF86AudioPlay, exec, ${playerctl} play-pause"
          ", XF86AudioPause, exec, ${playerctl} play-pause"
          ", XF86AudioNext, exec, ${playerctl} next"
          ", XF86AudioPrev, exec, ${playerctl} previous"
          ", XF86AudioRepeat, exec, ${playerctl} loop Track"
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];
      };
    };
  };
}
