{outputs, ...}: {
  imports = [
    ./hardware-configuration.nix

    ./users/tony.nix

    ./imports/global.nix
    ./imports/gnome.nix
    ./imports/hyprland.nix
    ./imports/nixld.nix
    ./imports/sound.nix
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
  time.hardwareClockInLocalTime = true;

  networking = {
    hostName = "citadel";
    networkmanager.enable = true;
  };

  system.stateVersion = "24.05";
}
