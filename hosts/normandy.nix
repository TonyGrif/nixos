{
  outputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    ./imports/homemanager.nix
    ./users/tony.nix

    ./imports/gnome.nix
    ./imports/hyprland.nix
    ./imports/locale.nix
    ./imports/nix.nix
    ./imports/nixld.nix
    ./imports/sound.nix
    ./imports/vim.nix
  ];

  nixpkgs = {
    overlays = [
      outputs.overlays.unstable-packages
    ];
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

  system.stateVersion = "24.05";
}
