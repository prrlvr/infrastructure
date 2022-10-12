{ pkgs ? import <nixpkgs> { } }:

with pkgs;

mkShell {
  buildInputs = [
    python39Packages.ruamel-yaml
    terraform
    ansible
    kubectl
    argocd
    stern
  ];
}
