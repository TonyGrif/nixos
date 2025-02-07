{
  inputs,
  outputs,
  ...
}: {
  imports = [
    ../globals.nix

    ./hardware-configuration.nix
    outputs.nixosModules.grub
    outputs.nixosModules.gdm

    outputs.nixosModules.pipewire

    outputs.nixosModules.gnome
    outputs.nixosModules.hyprland

    inputs.home-manager.nixosModules.home-manager
    ../users/tony.nix

    outputs.nixosModules.docker
    outputs.nixosModules.ollama
    outputs.nixosModules.virtmanager
  ];

  networking = {
    hostName = "citadel";
    networkmanager.enable = true;
  };

  grub = {
    enable = true;
    dualboot = true;
  };
  gdm.enable = true;

  pipewire.enable = true;

  gnome.enable = true;
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
