{
  docker = import ./docker.nix;
  displaymanagers = import ./displaymanagers;
  windowmanagers = import ./windowmanagers;
  gnome = import ./gnome.nix;
  grub = import ./grub.nix;
  hyprland = import ./hyprland;
  ollama = import ./ollama.nix;
  pipewire = import ./pipewire.nix;
  virtmanager = import ./virtmanager.nix;
}
