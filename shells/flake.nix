{
  description = "Nix flake for ... projects";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-unstable,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      # Only needed if packages are required from the unstable branch
      overlays = [
        (final: prev: {
          unstable = import nixpkgs-unstable {
            system = prev.system;
          };
        })
      ];
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [];
    };
  };
}
