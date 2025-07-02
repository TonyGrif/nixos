{
  grub = import ./grub.nix;
  displayManagers = import ./displaymanagers.nix;
  desktopEnvironments = import ./desktopEnvironments.nix;
  windowManagers = import ./windowManagers;
  containerServices = import ./containerServices;

  gaming = import ./gaming.nix;
}
