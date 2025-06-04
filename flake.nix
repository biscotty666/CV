{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";

    };
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
  };
  outputs = { nixpkgs, flake-utils, ... }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs {
        inherit system;
      };
    in {
      devShell = pkgs.mkShell {
        name = "quarto";
        buildInputs = with pkgs; [
            R
            rPackages.quarto
            chromium
            pandoc
            texlive.combined.scheme-full
            rstudio
            quarto
        ];

        shellHook = ''
            rstudio
        '';

      };
    }
  );
}
