{inputs, outputs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ./boot/dualgrub.nix

    ./imports/gnome.nix
    ./imports/hyprland.nix
    ./imports/nix.nix
    ./imports/nixld.nix
    ./imports/sound.nix
    ./imports/time.nix
    ./imports/vim.nix

    inputs.home-manager.nixosModules.home-manager
    ./users/tony.nix
  ];

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

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };

  system.stateVersion = "24.05";
}
