{
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./globals.nix

    outputs.homeManagerModules.browsers
    outputs.homeManagerModules.textEditors

    outputs.homeManagerModules.gnome

    outputs.homeManagerModules.coding
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

  gnome = {
    keybindings = true;
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
  };

  home.packages = with pkgs; [
    libreoffice-fresh
    discord
    spotify
    obsidian
    zoom-us

    pavucontrol # Audio
    yazi # TUI File Manager
    rofi # App launcher
    wl-clipboard # Clip
    grim # Screenshots

    tmux
    unstable.uv
    conda

    termusic
  ];

  home = {
    file.".ideavimrc".source = config.lib.file.mkOutOfStoreSymlink "/home/tony/nixos/dots/.ideavimrc";
    file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink "/home/tony/nixos/dots/.vimrc";
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
