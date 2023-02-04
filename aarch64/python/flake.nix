{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs }: 
  let
    system = "aarch64-darwin";
    overlays = [
        (self: super: {
          python = super.python311Full;
        })
      ];
    pkgs = import nixpkgs { inherit system overlays; };
  in
  {
    devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [ python ] ++ 
          (with pkgs.python311Packages; [ pipenv ]);
      };
  };
}
