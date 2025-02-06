{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.virtmanager;
in {
  options = {
    virtmanager = {
      enable = lib.mkEnableOption "Enable virtmanager module";
    };
  };

  config = lib.mkIf cfg.enable {
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          swtpm.enable = true;
          ovmf = {
            enable = true;
            packages = [
              (pkgs.OVMF.override {
                secureBoot = true;
                tpmSupport = true;
              })
              .fd
            ];
          };
        };
      };
    };

    programs.virt-manager.enable = true;
  };
}
