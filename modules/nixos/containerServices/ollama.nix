{
  lib,
  config,
  ...
}: let
  cfg = config.ollama;
in {
  options = {
    ollama.enable = lib.mkEnableOption "Enable ollama and tools services";
  };

  config = lib.mkIf cfg.enable {
    services = {
      ollama = {
        enable = true;
        # acceleration = ""
      };
      open-webui.enable = true;
    };
  };
}
