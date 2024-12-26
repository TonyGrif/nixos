{outputs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ./boot/dualgrub.nix

    ./imports/global.nix
    ./imports/gnome.nix
    ./imports/hyprland.nix
    ./imports/nixld.nix
    ./imports/sound.nix

    ./users/tony.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  networking = {
    hostName = "citadel";
    networkmanager.enable = true;
  };

  system.stateVersion = "24.05";
}
