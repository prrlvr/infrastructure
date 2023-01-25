{ pkgs ? import <nixpkgs> { } }:

with pkgs;

mkShell {
  buildInputs = [
    python39Packages.ruamel-yaml
    terraform
    ansible_2_12
    kubectl
    argocd
    stern
  ];
}
