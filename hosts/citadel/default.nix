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

    outputs.nixosModules.gnome
    outputs.nixosModules.windowManagers

    outputs.nixosModules.containerServices
    outputs.nixosModules.virtmanager

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
  displayManagers.gdm.enable = true;

  gnome.enable = true;
  windowManagers = {
    qtile.enable = true;
    hyprland = {
      enable = true;
      kitty = true;
    };
  };

  containerServices = {
    docker.enable = true;
    ollama.enable = true;
  };

  virtmanager.enable = true;

  system.stateVersion = "24.05";
}
