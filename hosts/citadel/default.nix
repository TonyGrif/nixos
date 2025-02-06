{
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../imports/nix.nix
    ../imports/time.nix

    inputs.home-manager.nixosModules.home-manager
    ../users/tony.nix

    outputs.nixosModules.grub
    outputs.nixosModules.docker
    outputs.nixosModules.hyprland
    outputs.nixosModules.gnome
    outputs.nixosModules.pipewire
    outputs.nixosModules.ollama
    outputs.nixosModules.vim
    outputs.nixosModules.virtmanager
  ];

  grub = {
    enable = true;
    dualboot = true;
  };

  networking = {
    hostName = "citadel";
    networkmanager.enable = true;
  };

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  pipewire.enable = true;
  docker.enable = true;

  gnome = {
    enable = true;
    gdm = true;
  };

  hyprland = {
    enable = true;
    dolphin = false;
    wofi = false;
  };

  vim.enable = true;

  ollama = {
    enable = true;
    webui = true;
  };
  virtmanager.enable = true;

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };

  system.stateVersion = "24.05";
}
