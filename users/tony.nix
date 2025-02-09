{
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./globals.nix

    outputs.homeManagerModules.fonts
    outputs.homeManagerModules.firefox

    outputs.homeManagerModules.vscode
    outputs.homeManagerModules.nvim
    outputs.homeManagerModules.jetbrains

    outputs.homeManagerModules.hyprpaper
    outputs.homeManagerModules.waybar
  ];

  home = {
    username = "tony";
    homeDirectory = "/home/tony";
  };

  programs.home-manager.enable = true;
  fonts.enable = true;

  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "vim";
    };
    shellAliases = {
      gs = "git status";
      gl = "git log";
    };
  };
  programs.git = {
    enable = true;
    userName = "TonyGrif";
    userEmail = "TonyGriffin2000@gmail.com";
  };

  firefox.enable = true;

  vscode.enable = true;
  nvim.enable = true;
  jetbrains.enable = true;

  waybar = {
    enable = true;
    experimental = true;
  };
  hyprpaper.enable = true;

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
    configFile.nvim = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tony/GriffiNvim";
      recursive = true;
    };
    configFile.hypr = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/tony/dotfiles/.config/hypr/";
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
