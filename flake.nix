{
  inputs.nixpkgs.url = "nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    let
      # to work with older version of flakes
      lastModifiedDate = self.lastModifiedDate or self.lastModified or "19700101";

      # Generate a user-friendly version number.
      version = (builtins.substring 0 8 lastModifiedDate) + self.rev;

      # System types to support.
      supportedSystems = [ "x86_64-linux" "aarch64-linux" ];

      # Helper function to generate an attrset '{ x86_64-linux = f "x86_64-linux"; ... }'.
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Nixpkgs instantiated for supported system 
      nixpkgsFor = forAllSystems (system: import nixpkgs { inherit system; });
      libFor = forAllSystems (system: import (nixpkgs + "/lib"));
      nixosLibFor = forAllSystems (system: import (nixpkgs + "/nixos/lib"));
    in flake-utils.lib.eachSystem supportedSystems (system: let 
      pkgs = import nixpkgs {
        inherit system;
      };
      lib = import (nixpkgs + "/lib") {
        inherit system;
      };
    in rec {
      devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            mdbook
          ];
      };
      packages.default = pkgs.stdenv.mkDerivation {
        name = "portfolio";
        src = ./.;
        buildInputs = with pkgs; [
          mdbook
        ];
        installPhase = ''
          mdbook build -d "$out"
        '';
      };
      packages.serve = pkgs.writeShellScriptBin "serve.sh" ''
        mdbook serve
      '';
      apps.default = { type = "app"; program = "${self.packages.${system}.serve}/bin/serve.sh"; };
  });
}
