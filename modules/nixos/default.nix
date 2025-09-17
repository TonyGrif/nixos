{
  grub = import ./grub.nix;
  displayManagers = ./displayManagers;
  gnome = import ./gnome.nix;
  i3 = import ./windowManagers/i3.nix;
  hyprland = import ./hyprland.nix;
  containerServices = import ./containerServices;

  gaming = import ./gaming.nix;
}
