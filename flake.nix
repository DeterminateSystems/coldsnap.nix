{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";

  outputs = { self, nixpkgs }:
    let
      forAllSystems = nixpkgs.lib.genAttrs ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"];
    in {
      packages = forAllSystems (system: {
        default = nixpkgs.legacyPackages.${system}.coldsnap;
      });
    };
}
