{
  description = "Generic flake to add some programs to the environment";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;
    flake-utils.url = github:numtide/flake-utils;
  };
  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib; eachSystem allSystems (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in {
    devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [ <insert packages here> ];
      };
  });
}
