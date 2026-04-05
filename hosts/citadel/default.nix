{
  inputs,
  outputs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-amd
    inputs.hardware.nixosModules.common-gpu-amd
    inputs.hardware.nixosModules.common-pc-ssd

    outputs.nixosModules

    ./hardware-configuration.nix
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
