{
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./globals.nix

    outputs.homeManagerModules.nvim
    outputs.homeManagerModules.hyprpaper
    outputs.homeManagerModules.waybar
  ];

  home = {
    username = "tony";
    homeDirectory = "/home/tony";
  };

  home.packages = with pkgs; [
    firefox
    discord
    spotify
    obsidian
    zoom-us
    distrobox
    pavucontrol
    yazi
    rofi-wayland
    wl-clipboard
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
    tmux
  ];

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "TonyGrif";
    userEmail = "TonyGriffin2000@gmail.com";
  };

  nvim.enable = true;

  waybar = {
    enable = true;
    experimental = true;
  };
  hyprpaper.enable = true;

  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "vim";
    };
  };

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

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
