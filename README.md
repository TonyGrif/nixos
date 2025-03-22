<h1 align="center"> :snowflake: NixOS :snowflake: </h1>
My NixOS configuration with flakes and home-manager support

## Usage
1. Add flakes support using export `NIX_CONFIG="experimental-features = nix-command flakes"`
2. Clone this repo using git
3. Copy hardware-configuration.nix from `/etc/nixos` into `nixos/hosts/`
4. Run `sudo nixos-rebuild switch --flake nixos/#hostname`
5. Reboot then run `home-manager switch --flake nixos/#username@hostname`

## Project Structure
```
flake.nix     # Configuration entry point
dots/         # Configuration files for various applications
hosts/        # NixOS configurations for my systems
modules/      # Personally created modules
overlays/     # Methods to extend and change nix packages
shells/       # Starter nix-shells for projects
users/        # Home-manager modules defining user environments
```

## Resources
* [Misterio77's NixOS Starter Template](https://github.com/Misterio77/nix-starter-configs)
* [Vimjoyer](https://www.youtube.com/@vimjoyer)
