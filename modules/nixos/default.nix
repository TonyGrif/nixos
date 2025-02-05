{
  docker = import ./docker.nix;
  gnome = import ./gnome.nix;
  hyprland = import ./hyprland;
  pipewire = import ./pipewire.nix;
  ollama = import ./ollama.nix;
  vim = import ./vim.nix;
  virtmanager = import ./virtmanager.nix;
}
