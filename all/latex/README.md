# My Resume.

Lock the nix flake with `nix flake lock`, this fixes the inputs of the flake (in this case, flake-utils and nixpkgs 22.11).

Compile it with `nix build`.

If you need extra packages, add them to the `texlive.combine` inherit line.  *Typically*, they can be inferred from build failures of the latex file.

Change the name of the document by changing the `name` variable in the `let` clause of the `outputs`.

Heavily influenced by [this](https://flyx.org/nix-flakes-latex/)
