{
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    outputs.homeManagerModules
  ];

  home = {
    username = "tony";
    homeDirectory = "/home/tony";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings.user = {
      name = "TonyGrif";
      email = "TonyGriffin2000@gmail.com";
    };
  };
  gnome = {
    keybindings = true;
  };

  browsers = {
    chromium = {
      enable = true;
      extensions = true;
    };
    firefox.enable = true;
  };

  textEditors = {
    nvim = {
      enable = true;
      pluginRequirements = true;
      lspRequirements = true;
    };
    vscode = {
      enable = true;
    };
  };

  hyprland = {
    enable = true;
    monitors = [
      "eDP-1, 1920x1080@60, 0x0, 1"
      "HDMI-A-1, 1920x1080@74.97, 1920x0, 1"
    ];
    workspaces = [
      "1, monitor:HDMI-A-1, default:true"
      "2, monitor:HDMI-A-1"
      "3, monitor:HDMI-A-1"
      "4, monitor:HDMI-A-1"
      "5, monitor:HDMI-A-1"
      "6, monitor:eDP-1, default:true"
    ];
  };

  kitty = {
    enable = true;
    fontSize = 14;
    fontType = "JetBrainsMono Nerd Font Mono";
  };

  rofi = {
    enable = true;
    fontSize = 14;
    fontType = "JetBrainsMono Nerd Font Mono";
  };

  coding = {
    bash = {
      enable = true;
      customization = true;
    };
    fonts = true;
    claude.enable = true;
    codex.enable = true;
  };
  work.enable = true;

  home.packages = with pkgs; [
    tmux
    discord
    spotify
    obsidian

    # Create separate modules
    pavucontrol
    yazi
    rofi
    wl-clipboard

    nicotine-plus
    termusic
  ];

  home = {
    file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink "/home/tony/dotfiles/.vimrc";
  };

  xdg = {
    enable = true;
    configFile.nvim = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tony/GriffiNvim";
      recursive = true;
    };
  };

  home.stateVersion = "24.05";
}
