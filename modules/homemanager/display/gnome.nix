{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.gnome;
in {
  options = {
    gnome = {
      keybindings = lib.mkEnableOption "Enable my keybindings through dconf";
    };
  };

  config = {
    dconf.settings = lib.optionals (cfg.keybindings) {
      "org/gnome/desktop/wm/keybindings" = {
        switch-to-workspace-1 = ["<Super>1"];
        switch-to-workspace-2 = ["<Super>2"];
        switch-to-workspace-3 = ["<Super>3"];
        switch-to-workspace-4 = ["<Super>4"];

        move-to-workspace-1 = ["<Super><Shift>1"];
        move-to-workspace-2 = ["<Super><Shift>2"];
        move-to-workspace-3 = ["<Super><Shift>3"];
        move-to-workspace-4 = ["<Super><Shift>4"];

        maximize = ["<Super>f"];
        unmaximize = ["<Super>j"];

        screenshot = ["<Super>p"];
        screenshot-window = ["<Alt>p"];
        show-screenshot-ui = ["<Super><Control>p"];
      };
    };
  };
}
