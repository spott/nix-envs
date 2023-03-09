{
  description = "Latex builder using pdflatex";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;
    flake-utils.url = github:numtide/flake-utils;
  };
  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib; eachSystem allSystems (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      tex = pkgs.texlive.combine {
          inherit (pkgs.texlive) scheme-basic latex-bin latexmk ;
      };
      name = "document";
    in rec {
      packages = {
        document = pkgs.stdenvNoCC.mkDerivation rec {
          inherit name;
          src = self;
          buildInputs = [ pkgs.coreutils tex ];
          phases = ["unpackPhase" "buildPhase" "installPhase"];
          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}";
            mkdir -p .cache/texmf-var
            env TEXMFHOME=.cache TEXMFVAR=.cache/texmf-var \
              latexmk -interaction=nonstopmode -pdf -pdflatex \
              ${name}.tex
          '';
          installPhase = ''
            mkdir -p $out
            cp ${name}.pdf $out/
          '';
        };
      };
      defaultPackage = packages.document;
    });
}
