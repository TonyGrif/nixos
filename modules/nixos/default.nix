{
  docker = import ./docker.nix;
  gdm = import ./gdm.nix;
  gnome = import ./gnome.nix;
  grub = import ./grub.nix;
  hyprland = import ./hyprland;
  ollama = import ./ollama.nix;
  pipewire = import ./pipewire.nix;
  vim = import ./vim.nix;
  virtmanager = import ./virtmanager.nix;
}
