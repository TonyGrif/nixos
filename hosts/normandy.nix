{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix

    # You can also split up your configuration and import pieces of it here:
    # ./users.nix

    ./imports/nixld.nix
    ./imports/locale.nix
    ./imports/vim.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      # Opinionated: disable global registry
      flake-registry = "";
      # Workaround for https://github.com/NixOS/nix/issues/9574
      nix-path = config.nix.nixPath;
    };
    # Opinionated: disable channels
    channel.enable = false;

    # Opinionated: make flake registry and nix path match flake inputs
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
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

  services.xserver = {
    enable = true;

    displayManager = {
      gdm.enable = true;
    };

    desktopManager = {
      xterm.enable = false;
      gnome.enable = true;
    };

    xkb = {
      layout = "us";
      variant = "";
    };
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
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
