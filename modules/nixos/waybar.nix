{
  config,
  lib,
  pkgs,
  ...
}: {
  options = {
    waybar.enable = lib.mkEnableOption "Enable waybar";
    # waybar.experimental = lib.mkEnableOption "Enable experimental features";
  };

  config = lib.mkIf config.waybar.enable {
    environment.systemPackages = with pkgs; [
      (
        waybar.overrideAttrs (oldAttrs: {
          mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
        })
      )
    ];
  };
}
