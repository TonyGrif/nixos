{
  lib,
  config,
  ...
}: let
  cfg = config.docker;
in {
  options = {
    docker = {
      enable = lib.mkEnableOption "Enable docker module";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      rootless = {
        enable = true;
        setSocketVariable = true;
      };
    };
  };
}
