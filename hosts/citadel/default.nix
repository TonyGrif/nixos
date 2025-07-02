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

    outputs.nixosModules.grub
    outputs.nixosModules.displayManagers

    outputs.nixosModules.desktopEnvironments
    outputs.nixosModules.windowManagers

    outputs.nixosModules.containerServices
    outputs.nixosModules.virtmanager # TODO: Look into this setup more

    outputs.nixosModules.gaming # TODO: Complete this module

    inputs.home-manager.nixosModules.home-manager
    ./users.nix
  ];

  networking = {
    hostName = "citadel";
    networkmanager.enable = true;
  };

  grub = {
    enable = true;
    dualboot = true;
  };
  displayManagers.gdm = {
    enable = true;
    suspend = false;
  };

  desktopEnvironments.gnome.enable = true;
  windowManagers = {
    hyprland = {
      enable = true;
      kitty = true;
    };
  };

  containerServices = {
    docker.enable = true;
    ollama = {
      enable = true;
      gpu = "rocm";
      webui = true;
    };
  };

  virtmanager.enable = true;

  gaming = {
    enable = true;
    amd = true;
  };

  system.stateVersion = "24.05";
}
