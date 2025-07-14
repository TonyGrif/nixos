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
    outputs.nixosModules.ly

    outputs.nixosModules.hyprland

    outputs.nixosModules.containerServices

    inputs.home-manager.nixosModules.home-manager
    ./users.nix
  ];

  networking = {
    hostName = "normandy";
    networkmanager.enable = true;
  };

  grub.enable = true;
  ly.enable = true;

  hyprland = {
    enable = true;
    kitty = true;
  };

  containerServices.docker.enable = true;

  system.stateVersion = "24.05";
}
