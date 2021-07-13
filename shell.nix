with import <nixpkgs> {};
with python39Packages;
( let
  docstring-to-markdown = callPackage ./docstring-to-markdown.nix { };
in python39.withPackages (ps: [
  docstring-to-markdown
])
).env
