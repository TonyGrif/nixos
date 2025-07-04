{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.lenovo-thinkpad-x1-6th-gen

    ../globals.nix

    ./hardware-configuration.nix
    outputs.nixosModules.grub
    outputs.nixosModules.displayManagers

    outputs.nixosModules.windowManagers

    outputs.nixosModules.containerServices

    inputs.home-manager.nixosModules.home-manager
    ./users.nix
  ];

  networking = {
    hostName = "normandy";
    networkmanager.enable = true;
  };

  grub.enable = true;
  displayManagers.ly.enable = true;

  windowManagers = {
    hyprland = {
      enable = true;
      kitty = true;
    };
  };

  containerServices.docker.enable = true;

  system.stateVersion = "24.05";
}
