{
  grub = import ./grub.nix;
  gdm = import ./displayManagers/gdm.nix;
  ly = import ./displayManagers/ly.nix;
  gnome = import ./gnome.nix;
  windowManagers = import ./windowManagers;
  containerServices = import ./containerServices;
}
