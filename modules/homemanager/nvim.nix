{outputs, lib, config, pkgs, ...}:
{
  options = {
    nvim.enable = lib.mkEnableOption "Enable neovim and needed requirements";
  };

  config = lib.mkIf config.nvim.enable {
    nixpkgs = {
      overlays = [
        outputs.overlays.unstable-packages
      ];
    };

    home.packages = with pkgs; [
      unstable.neovim
      gcc
      gnumake
      ripgrep
      cargo
      python3
      nodejs
    ];
  };
}
