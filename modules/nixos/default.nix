{
  grub = import ./grub.nix;
  displayManagers = import ./displaymanagers.nix;

  gnome = import ./gnome.nix;
  windowManagers = import ./windowManagers;
  containerServices = import ./containerServices;
  virtmanager = import ./virtmanager.nix;
  gaming = import ./gaming.nix;
}
