{
  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.533189.tar.gz";

  outputs = { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];
    in {
      packages = forAllSystems (system: {
        default = nixpkgs.legacyPackages.${system}.coldsnap;
      });
    };
}
