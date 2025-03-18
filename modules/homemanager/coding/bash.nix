{
  lib,
  config,
  ...
}: let
  cfg = config.bash;
in {
  options = {
    bash = {
      enable = lib.mkEnableOption "Enable bash program";
      customization = lib.mkEnableOption "Enable bash shell customizations";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.bash = {
      enable = true;
      shellAliases = {
        gs = "git status";
        gl = "git log";
      };
      initExtra = lib.optionals (cfg.customization) "eval \"$(starship init bash)\"";
    };
    programs.starship = lib.optionals (cfg.customization) {
      enable = true;
    };
  };
}
