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
    vim
    firefox
    (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})

    discord
  ];

  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "TonyGrif";
    userEmail = "TonyGriffin2000@gmail.com";
  };

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
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "24.05";
}
