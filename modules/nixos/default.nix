{
  docker = import ./docker.nix;
  gnome = import ./gnome.nix;
  hyprland = import ./hyprland;
  ollama = import ./ollama.nix;
  pipewire = import ./pipewire.nix;
  vim = import ./vim.nix;
  virtmanager = import ./virtmanager.nix;
}
