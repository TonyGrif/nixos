{
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./globals.nix

    outputs.homeManagerModules.firefox

    outputs.homeManagerModules.coding
    outputs.homeManagerModules.office
    outputs.homeManagerModules.creative

    outputs.homeManagerModules.hyprlandUtils

    outputs.homeManagerModules.waybar
  ];

  home = {
    username = "tony";
    homeDirectory = "/home/tony";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "TonyGrif";
    userEmail = "TonyGriffin2000@gmail.com";
  };

  firefox.enable = true;

  coding = {
    bash = {
      enable = true;
      customization = true;
    };
    fonts = true;
    jetbrains = true;
    nvim = {
      enable = true;
      pluginRequirements = true;
      lspRequirements = true;
    };
  };

  office = {
    libreoffice.enable = true;
  };

  creative = {
    pixelArt.enable = true;
  };

  hyprlandUtils = {
    swww.enable = true;
  };

  waybar = {
    enable = true;
    experimental = true;
  };

  home.packages = with pkgs; [
    discord
    spotify
    obsidian
    zoom-us

    # Create separate modules
    pavucontrol
    yazi
    rofi-wayland
    wl-clipboard
    tmux
  ];

  home = {
    file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink "/home/tony/dotfiles/.vimrc";
    file.".tmux.conf".source = config.lib.file.mkOutOfStoreSymlink "/home/tony/dotfiles/.tmux.conf";
  };

  xdg = {
    enable = true;
    configFile.qtile = {
      source = ../../dots/qtile;
      recursive = true;
    };
    configFile.hypr = {
      source = ../../dots/wayland/hyprland;
      recursive = true;
    };
    configFile.nvim = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tony/GriffiNvim";
      recursive = true;
    };
    configFile.kitty = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tony/dotfiles/.config/kitty/";
      recursive = true;
    };
    configFile.rofi = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tony/dotfiles/.config/rofi/";
      recursive = true;
    };
    configFile.waybar = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tony/dotfiles/.config/waybar/";
      recursive = true;
    };
  };

  home.stateVersion = "24.05";
}
