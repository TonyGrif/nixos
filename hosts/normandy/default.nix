{
  inputs,
  outputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ../boot/grub.nix

    ../imports/nix.nix
    ../imports/nixld.nix
    ../imports/time.nix
    ../imports/vim.nix

    inputs.home-manager.nixosModules.home-manager
    ../users/tony.nix

    outputs.nixosModules.hyprland
    outputs.nixosModules.gnome
    outputs.nixosModules.pipewire
  ];

  networking = {
    hostName = "normandy";
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

  gnome.enable = true;

  hyprland = {
    enable = true;
    dolphin = false;
    wofi = false;
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };

  system.stateVersion = "24.05";
}
