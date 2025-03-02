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
    outputs.nixosModules.displaymanagers

    outputs.nixosModules.windowManagers

    outputs.nixosModules.pipewire

    inputs.home-manager.nixosModules.home-manager
    ../users/tony.nix
  ];

  networking = {
    hostName = "normandy";
    networkmanager.enable = true;
  };

  grub.enable = true;
  displaymanagers.gdm.enable = true;

  windowManagers = {
    qtile.enable = true;
    hyprland = {
      enable = true;
      kitty = true;
    };
  };

  pipewire.enable = true;

  system.stateVersion = "24.05";
}
