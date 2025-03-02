{
  docker = import ./docker.nix;
  displayManagers = import ./displayManagers;
  gnome = import ./gnome.nix;
  grub = import ./grub.nix;
  ollama = import ./ollama.nix;
  pipewire = import ./pipewire.nix;
  virtmanager = import ./virtmanager.nix;
  windowManagers = import ./windowManagers;
}
