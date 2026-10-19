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
      "docker"
      "libvirtd"
      "networkmanager"
      "wheel"
      "input"
      "video"
      "render"
    ];
    packages = [pkgs.home-manager];
  };
}
