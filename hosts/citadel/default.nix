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

    outputs.nixosModules.gnome
    outputs.nixosModules.windowmanagers

    outputs.nixosModules.pipewire

    outputs.nixosModules.hyprland

    outputs.nixosModules.docker
    outputs.nixosModules.ollama
    outputs.nixosModules.virtmanager

    inputs.home-manager.nixosModules.home-manager
    ../users/tony.nix
  ];

  networking = {
    hostName = "citadel";
    networkmanager.enable = true;
  };

  grub = {
    enable = true;
    dualboot = true;
  };
  displaymanagers.gdm.enable = true;

  gnome.enable = true;
  windowmanagers.i3 = true;

  pipewire.enable = true;

  hyprland = {
    enable = true;
    dolphin = false;
    wofi = false;
  };

  docker.enable = true;
  ollama = {
    enable = true;
    webui = true;
  };
  virtmanager.enable = true;

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };

  system.stateVersion = "24.05";
}
