{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    ./imports/gnome.nix
    ./imports/locale.nix
    ./imports/nix.nix
    ./imports/nixld.nix
    ./imports/sound.nix
    ./imports/vim.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
    };
    systemd-boot.enable = false;
  };

  networking = {
    hostName = "normandy";
    networkmanager.enable = true;
  };

  users.users = {
    tony = {
      isNormalUser = true;
      extraGroups = ["networkmanager" "wheel"];
      packages = [inputs.home-manager.packages.${pkgs.system}.default];
    };
  };

  system.stateVersion = "24.05";
}
