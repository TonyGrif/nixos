{
  inputs,
  outputs,
  ...
}: {
  imports = [
    ../globals.nix

    ./hardware-configuration.nix
    outputs.nixosModules.grub
    outputs.nixosModules.displaymanagers

    outputs.nixosModules.windowManagers
    outputs.nixosModules.hyprland

    outputs.nixosModules.pipewire

    inputs.home-manager.nixosModules.home-manager
    ../users/tony.nix
  ];

  networking = {
    hostName = "normandy";
    networkmanager.enable = true;
  };

  grub.enable = true;
  displaymanagers.gdm = true;

  windowManagers = {
    qtile = true;
  };

  hyprland = {
    enable = true;
    dolphin = false;
    wofi = false;
  };

  pipewire.enable = true;

  system.stateVersion = "24.05";
}
