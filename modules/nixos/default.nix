{
  grub = import ./grub.nix;
  gdm = import ./displayManagers/gdm.nix;
  ly = import ./displayManagers/ly.nix;
  gnome = import ./gnome.nix;
  i3 = import ./windowManagers/i3.nix;
  hyprland = import ./hyprland.nix;
  containerServices = import ./containerServices;

  gaming = import ./gaming.nix;
}
