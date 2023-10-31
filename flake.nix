{
  inputs.blog-helper.url = "sourcehut:~gotlou/blog-helper";
  inputs.blog-helper.inputs.nixpkgs.follows = "nixpkgs";

  outputs = { self, nixpkgs, blog-helper }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        name = "blog-shell";
        buildInputs = [
          blog-helper.packages.x86_64-linux.default
        ];
      };
    };
}
