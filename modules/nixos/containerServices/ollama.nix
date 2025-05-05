{
  lib,
  config,
  ...
}: let
  cfg = config.ollama;
in {
  options = {
    ollama = {
      enable = lib.mkEnableOption "Enable ollama and tools services";
      gpu = lib.mkOption {
        type = lib.types.str;
        default = null;
        description = "GPU acceleration to use";
      };
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ollama = {
        enable = true;
        acceleration = cfg.gpu;
      };
      open-webui.enable = true;
    };
  };
}
