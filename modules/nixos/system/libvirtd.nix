{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.services.libvirtd;
in {
  options = {
    services.libvirtd.enable = lib.mkEnableOption "Enable libvirtd for managing virtual machines";
  };

  config = lib.mkIf cfg.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };

    programs.virt-manager.enable = true;
  };
}
