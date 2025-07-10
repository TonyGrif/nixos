{
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./globals.nix

    outputs.homeManagerModules.hyprland

    outputs.homeManagerModules.browsers

    outputs.homeManagerModules.coding
    outputs.homeManagerModules.office
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

  hyprland = {
    swww.enable = true;
    waybar.enable = true;
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
    nvim = {
      enable = true;
      pluginRequirements = true;
      lspRequirements = true;
    };
  };

  home.packages = with pkgs; [
    discord
    spotify
    obsidian

    # Create separate modules
    pavucontrol
    yazi
    rofi-wayland
    wl-clipboard
  ];

  home = {
    file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink "/home/tony/dotfiles/.vimrc";
  };

  xdg = {
    enable = true;
    configFile.hypr = {
      source = ../../dots/hyprland;
      recursive = true;
    };
    configFile.kitty = {
      source = ../../dots/wayland/kitty;
      recursive = true;
    };
    configFile.waybar = {
      source = ../../dots/wayland/waybar;
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
