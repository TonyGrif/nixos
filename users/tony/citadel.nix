{
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./globals.nix

    outputs.homeManagerModules.browsers

    outputs.homeManagerModules.coding
    outputs.homeManagerModules.office
    outputs.homeManagerModules.creative

    outputs.homeManagerModules.hyprlandUtils
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

  browsers = {
    chromium = {
      enable = true;
      extensions = true;
    };
    firefox.enable = true;
  };

  coding = {
    bash = {
      enable = true;
      customization = true;
    };
    fonts = true;
    jetbrains = {
      pycharm = true;
    };
    nvim = {
      enable = true;
      config.enable = true;
    };
    vscode.enable = true;
  };

  office = {
    libreoffice.enable = true;
  };

  creative = {
    pixelArt.enable = true;
  };

  hyprlandUtils = {
    swww.enable = true;
    waybar.enable = true;
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
    unstable.uv
  ];

  home = {
    file.".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink "/home/tony/nixos/dots/.ideavimrc";
    file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink "/home/tony/nixos/dots/.vimrc";
  };

  xdg = {
    enable = true;
    configFile.hypr = {
      source = ../../dots/wayland/hyprland;
      recursive = true;
    };
    configFile.kitty = {
      source = ../../dots/wayland/kitty;
      recursive = true;
    };
    configFile.waybar = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/nixos/dots/wayland/waybar";
      recursive = true;
    };
    configFile.qtile = {
      source = ../../dots/qtile;
      recursive = true;
    };
    configFile.nvim = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tony/GriffiNvim";
      recursive = true;
    };
    configFile.rofi = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tony/dotfiles/.config/rofi/";
      recursive = true;
    };
  };

  home.stateVersion = "24.05";
}
