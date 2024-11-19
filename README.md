# NixOS

## Usage
1. Add flakes support using export NIX_CONFIG="experimental-features = nix-command flakes"
2. Clone this repo
3. Copy hardware-configuration.nix from /etc/nixos into nixos/nixos
4. Run sudo nixos-rebuild switch --flake nixos/#username@hostname
5. Reboot then run home-manager switch --flake nixos/#username@hostname
