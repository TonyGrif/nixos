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
    outputs.nixosModules.gdm

    outputs.nixosModules.gnome
    outputs.nixosModules.hyprland

    outputs.nixosModules.containerServices
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
  gdm = {
    enable = true;
    suspend = false;
  };

  gnome.enable = true;
  hyprland = {
    enable = true;
    kitty = true;
  };

  containerServices = {
    docker.enable = true;
    ollama = {
      enable = true;
      gpu = "rocm";
      webui = true;
    };
  };

  gaming = {
    enable = true;
    amd = true;
  };

  system.stateVersion = "24.05";
}
