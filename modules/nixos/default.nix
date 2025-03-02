{
  docker = import ./docker.nix;
  displaymanagers = import ./displaymanagers.nix;
  gnome = import ./gnome.nix;
  grub = import ./grub.nix;
  ollama = import ./ollama.nix;
  pipewire = import ./pipewire.nix;
  virtmanager = import ./virtmanager.nix;
  windowManagers = import ./windowManagers;
}
