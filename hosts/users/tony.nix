{
  pkgs,
  config,
  ...
}: let
  ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in {
  users.users.tony = {
    isNormalUser = true;
    extraGroups = ifTheyExist [
      "networkmanager"
      "wheel"
      "libvirtd"
      "docker"
    ];
    packages = [pkgs.home-manager];
  };

  home-manager.users.tony = import ../../users/tony.nix;
}
