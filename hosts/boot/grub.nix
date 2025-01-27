{
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = false;
    };
    systemd-boot.enable = false;
  };
  time.hardwareClockInLocalTime = true;
}
