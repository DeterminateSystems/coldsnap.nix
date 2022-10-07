{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable-small";
  inputs.coldsnap = {
    url = "github:awslabs/coldsnap";
    flake = false;
  };

  outputs = { self, nixpkgs, coldsnap }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux; in {
      packages.x86_64-linux.default = pkgs.rustPlatform.buildRustPackage {
        name = "coldsnap";
        src = coldsnap;
        cargoLock.lockFile = "${coldsnap}/Cargo.lock";

        buildInputs = [ pkgs.openssl ];
        nativeBuildInputs = [ pkgs.pkg-config ];
      };

    };
}
