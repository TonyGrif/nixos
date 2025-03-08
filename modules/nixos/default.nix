{
  displayManagers = import ./displayManagers;
  containerServices = import ./containerServices;
  gnome = import ./gnome.nix;
  grub = import ./grub.nix;
  virtmanager = import ./virtmanager.nix;
  windowManagers = import ./windowManagers;
}
