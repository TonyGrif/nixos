{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.browsers;
in {
  options = {
    browsers = {
      firefox = {
        enable = lib.mkEnableOption "Enable firefox module";
      };
      chromium = {
        enable = lib.mkEnableOption "Enable chromium module";
        extensions = lib.mkEnableOption "Enable extensions for chromium";
      };
    };
  };

  config = {
    programs = {
      firefox = {
        enable = cfg.firefox.enable;
        # Required for Wayland screen sharing (PipeWire screencast).
        package = lib.mkIf cfg.firefox.enable (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override {pipewireSupport = true;}) {});
      };
      chromium = lib.mkIf (cfg.chromium.enable) {
        enable = true;
        extensions = lib.mkIf (cfg.chromium.extensions) [
          "dbepggeogbaibhgnhhndojpepiihcmeb"
        ];
      };
    };
  };
}
