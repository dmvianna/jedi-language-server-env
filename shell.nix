with import <nixpkgs> {};
with python39Packages;
( let
  docstring-to-markdown = callPackage ./docstring-to-markdown.nix { };
  jedi = callPackage ./jedi.nix { };
  pygls = callPackage ./pygls.nix { };
  jedi-language-server = callPackage ./jedi-language-server.nix {
    docstring-to-markdown = docstring-to-markdown;
    jedi = jedi;
    pygls = pygls;
  };
in python39.withPackages (ps: [
  docstring-to-markdown
  jedi-language-server
  jedi
  pygls
])
).env
