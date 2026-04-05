{
  lib,
  config,
  pkgs,
  ...
}: {
  options = {
    fonts.enable = lib.mkEnableOption "Enable certain font packages";
  };

  config = lib.mkIf config.fonts.enable {
    home.packages = with pkgs; [
      nerd-fonts.jetbrains-mono
    ];
  };
}
