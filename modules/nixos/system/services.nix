{
  lib,
  config,
  ...
}: let
  cfg = config.services;
in {
  options = {
    services = {
      docker.enable = lib.mkEnableOption "Enable Docker service for users in Docker group";
    };
  };

  config = {
    virtualisation.docker = lib.mkIf (cfg.docker.enable) {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}
