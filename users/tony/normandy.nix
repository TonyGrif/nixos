{
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./globals.nix

    outputs.homeManagerModules.textEditors
    outputs.homeManagerModules.gnome

    outputs.homeManagerModules.browsers

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

  coding = {
    bash = {
      enable = true;
      customization = true;
    };
    fonts = true;
    claude.enable = true;
  };

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
