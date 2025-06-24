{
  lib,
  config,
  ...
}: let
  cfg = config.containerServices;
in {
  imports = [
    ./ollama.nix
  ];

  options = {
    containerServices = {
      docker.enable = lib.mkEnableOption "Enable Docker service for users in Docker group to use";
      ollama = {
        enable = lib.mkEnableOption "Enable ollama and tools systemd service";
        gpu = lib.mkOption {
          type = lib.types.str;
          default = null;
          description = "GPU acceleration to enable";
        };
        webui = lib.mkEnableOption "Enable open-webui to complement ollama";
      };
    };
  };

  config = {
    virtualisation.docker = lib.optionals (cfg.docker.enable) {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };

    ollama = lib.mkIf (cfg.ollama.enable) {
      enable = true;
      gpu = cfg.ollama.gpu;
      webui = cfg.ollama.webui;
    };
  };
}
