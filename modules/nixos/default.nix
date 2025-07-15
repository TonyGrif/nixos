{
  grub = import ./grub.nix;
  displayManagers = ./displayManagers;
  gnome = import ./gnome.nix;
  hyprland = import ./hyprland.nix;
  containerServices = import ./containerServices;

  gaming = import ./gaming.nix;
}
