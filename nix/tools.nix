{ actionlint
, alejandra
, ansible-lint
, cabal-fmt
, cabal2nix
, callPackage
, cargo
, clang-tools
, clippy
, deadnix
, dhall
, elmPackages
, git
, gitAndTools
, hadolint
, haskell
, haskellPackages
, hindent
, hlint
, hpack
, html-tidy
, hunspell
, luaPackages
, niv
, mdsh
, nix-linter
, nixfmt
, nixpkgs-fmt
, nodePackages
, ormolu
, python39Packages
, runCommand
, rustfmt
, shellcheck
, shfmt
, statix
, stylish-haskell
, stylua
, texlive
, writeScript
, writeText
, go
, go-tools
, revive
}:

{
  inherit actionlint alejandra cabal-fmt cabal2nix cargo clang-tools clippy deadnix dhall hadolint hindent hlint hpack html-tidy nix-linter nixfmt nixpkgs-fmt ormolu rustfmt shellcheck shfmt statix stylish-haskell stylua go mdsh revive go-tools;
  inherit (elmPackages) elm-format elm-review elm-test;
  # TODO: these two should be statically compiled
  inherit (haskellPackages) brittany fourmolu;
  inherit (luaPackages) luacheck;
  inherit (nodePackages) eslint markdownlint-cli prettier purs-tidy;
  inherit (python39Packages) ansible-lint yamllint;
  cabal2nix-dir = callPackage ./cabal2nix-dir { };
  hpack-dir = callPackage ./hpack-dir { };
  hunspell = callPackage ./hunspell { };
  purty = callPackage ./purty { purty = nodePackages.purty; };
  terraform-fmt = callPackage ./terraform-fmt { };
  latexindent = texlive.combined.scheme-medium;
  chktex = texlive.combined.scheme-medium;
}
