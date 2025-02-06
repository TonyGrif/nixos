{
  lib,
  config,
  ...
}: let
  cfg = config.ollama;
in {
  options = {
    ollama = {
      enable = lib.mkEnableOption "Enable ollama module";
      webui = lib.mkEnableOption "Enable open-webui server to run on localhost:8080";
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ollama.enable = true;
      open-webui.enable = lib.mkIf (cfg.webui) true;
    };
  };
}
