let
  unstableTarball = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import <nixpkgs> {};
  unstable = import unstableTarball {};
in

pkgs.mkShell {
    packages = with pkgs; [];
}
