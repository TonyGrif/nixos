{
  grub = import ./grub.nix;
  gdm = import ./displayManagers/gdm.nix;
  ly = import ./displayManagers/ly.nix;
  gnome = import ./gnome.nix;
  hyprland = import ./hyprland.nix;
  containerServices = import ./containerServices;

  gaming = import ./gaming.nix;
}
