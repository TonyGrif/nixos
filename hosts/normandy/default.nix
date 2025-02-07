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

    outputs.nixosModules.vim
  ];

  networking = {
    hostName = "normandy";
    networkmanager.enable = true;
  };

  grub.enable = true;
  gdm.enable = true;

  pipewire.enable = true;

  gnome.enable = true;
  hyprland = {
    enable = true;
    dolphin = false;
    wofi = false;
  };

  vim.enable = true;

  home-manager = {
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };

  system.stateVersion = "24.05";
}
