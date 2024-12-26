{
  outputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    outputs.homeManagerModules.nvim
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  home = {
    username = "tony";
    homeDirectory = "/home/tony";
  };

  home.packages = with pkgs; [
    firefox
    discord
    spotify
    obsidian

    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
  ];

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "TonyGrif";
    userEmail = "TonyGriffin2000@gmail.com";
  };
  programs.kitty.enable = true;

  nvim.enable = true;

  programs.bash = {
    enable = true;
    sessionVariables = {
      EDITOR = "vim";
    };
  };

  home.file.".vimrc".source = config.lib.file.mkOutOfStoreSymlink "/home/tony/dotfiles/.vimrc";
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
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
