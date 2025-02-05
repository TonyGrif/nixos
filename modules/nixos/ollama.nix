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
    };
  };

  config = lib.mkIf cfg.enable {
    services = {
      ollama.enable = true;
      open-webui.enable = true;
    };
  };
}
