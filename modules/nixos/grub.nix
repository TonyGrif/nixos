{
  lib,
  config,
  ...
}: let
  cfg = config.grub;
in {
  options = {
    grub = {
      enable = lib.mkEnableOption "Enable grub bootloader";
      dualboot = lib.mkEnableOption "Enable dual boot functionality";
    };
  };

  config = lib.mkIf cfg.enable {
    boot.loader = {
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        useOSProber = lib.mkIf(cfg.dualboot) true;
      };
      systemd-boot.enable = false;
    };
    time.hardwareClockInLocalTime = true;
  };
}
