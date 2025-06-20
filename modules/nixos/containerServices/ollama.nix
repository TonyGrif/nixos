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
	webui = lib.mkEnableOption "Enable open-webui to compliment ollama";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ollama = {
        enable = true;
        acceleration = cfg.gpu;
      };
      open-webui.enable = lib.mkIf (cfg.webui) true;
    };
  };
}
