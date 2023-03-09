{
  description = "Generic flake to add some programs to the environment";
  inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;
    nixpkgs-unstable.url = github:NixOS/nixpkgs/nixos-unstable;
    flake-utils.url = github:numtide/flake-utils;
  };
  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib; eachSystem allSystems (system:
    let
      pkgs-unstable = import nixpkgs-unstable { inherit system; };
      overlays = [ (self: super: {
                      #if you want to use specific packages from unstable rather than 22.11
                      #<package> = pkgs-unstable.<package>;
                      })
                 ];
      pkgs = import nixpkgs { inherit system overlays; };
    in {
    devShells.default = pkgs.mkShell {
        buildInputs = with pkgs; [ 
          #<insert packages here> 
        ];
      };
  });
}
