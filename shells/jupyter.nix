let
  unstableTarball = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-unstable";
  pkgs = import <nixpkgs> {};
  unstable = import unstableTarball {};
in
  pkgs.mkShellNoCC {
    packages = with pkgs; [
      python312Packages.jupyterlab
      python312Packages.pandas
      python312Packages.seaborn
    ];
  }
