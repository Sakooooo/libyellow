{
  description = "flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      inherit (builtins) attrValues;
      eachSystem = f:
        lib.genAttrs [ "x86_64-linux" "aarch64-linux" ]
        (system: f nixpkgs.legacyPackages.${system});
    in {

      # packages = eachSystem (pkgs: rec {
      #   default = libyellow;
      #   libyellow = pkgs.callPackage ./package.nix { };
      # });

      devShells = eachSystem (pkgs: {
        default = pkgs.mkShell {
          packages = attrValues { inherit (pkgs) cmake ninja; };
        };
      });

    };
}
