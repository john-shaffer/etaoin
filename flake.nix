{
  description = "etaoin";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }@inputs:
    flake-utils.lib.eachDefaultSystem (system:
      with import nixpkgs { inherit system; }; {
        devShells.default = mkShell {
          buildInputs = [
            babashka
            chromedriver
            chromium
            clojure
            firefox
            geckodriver
            imagemagick
            jdk
            rlwrap # Used by clj
          ];
        };
      });
}
