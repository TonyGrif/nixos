{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.lenovo-thinkpad-x1-6th-gen

    ../globals.nix

    ./hardware-configuration.nix

    outputs.nixosModules.bootloaders
    outputs.nixosModules.displayManagers
    outputs.nixosModules.desktopManagers
    outputs.nixosModules.windowManagers
    outputs.nixosModules.services

    inputs.home-manager.nixosModules.home-manager
    ./users.nix
  ];

  networking = {
    hostName = "normandy";
    networkmanager.enable = true;
  };

  bootloaders = {
    grub = {
      enable = true;
    };
  };

  displayManagers = {
    ly = {
      enable = true;
    };
  };

  desktopManagers = {
    gnome.enable = true;
  };

  windowManagers = {
    hyprland = {
      enable = true;
      kitty = true;
    };
  };

  services = {
    docker.enable = true;
  };

  system.stateVersion = "24.05";
}
