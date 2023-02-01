{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "x86_64-darwin";
    overlays = [
        (self: super: {
          python = super.python310;
        })
      ];
    pkgs = import nixpkgs { inherit system overlays; };
  in
  {
    devShells.aarch64-darwin.default = pkgs.mkShell {
        buildInputs = with pkgs; [ python ] ++ 
          (with pkgs.python310Packages; [ pipenv ]);
      };
  };
}
