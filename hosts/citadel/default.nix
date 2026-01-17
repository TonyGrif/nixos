{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    ../globals.nix

    ./hardware-configuration.nix

    outputs.nixosModules.bootloaders
    outputs.nixosModules.displayManagers
    outputs.nixosModules.desktopManagers
    outputs.nixosModules.windowManagers
    outputs.nixosModules.services
    outputs.nixosModules.gaming

    inputs.home-manager.nixosModules.home-manager
    ./users.nix
  ];

  networking = {
    hostName = "citadel";
    networkmanager.enable = true;
  };

  bootloaders = {
    grub = {
      enable = true;
      dualboot = true;
    };
  };

  displayManagers = {
    gdm = {
      enable = true;
      suspend = false;
    };
  };

  desktopManagers = {
    gnome.enable = true;
  };

  windowManagers = {
    niri = {
      enable = true;
    };
    hyprland = {
      enable = true;
      kitty = true;
    };
  };

  services = {
    docker.enable = true;
  };

  gaming = {
    emulation = {
      retroarch.enable = true;
    };
  };

  system.stateVersion = "24.05";
}
