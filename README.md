# NixOS

## Usage
1. Add flakes support using export `NIX_CONFIG="experimental-features = nix-command flakes"`
2. Clone this repo using git
3. Copy hardware-configuration.nix from `/etc/nixos` into `nixos/hosts/`
4. Run `sudo nixos-rebuild switch --flake nixos/#hostname`
5. Reboot then run `home-manager switch --flake nixos/#username@hostname`
