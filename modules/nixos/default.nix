{
  bootloaders = import ./bootloaders.nix;
  displayManagers = import ./displayManagers.nix;
  desktopManagers = import ./desktopManagers.nix;
  windowManagers = import ./windowManagers.nix;
  services = import ./services.nix;
}
