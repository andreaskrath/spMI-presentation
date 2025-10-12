{
  description = "Development environment for Typst with Youting.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShells.default = with pkgs;
          mkShell {
            buildInputs = [
              typst
              lexend
              fira-sans
              noto-fonts
              font-awesome
              typstPackages.touying
              typstPackages.numbly
            ];
            TYPST_FONT_PATHS = lib.concatStringsSep ":" [
              "${pkgs.lexend}/share/fonts"
              "${pkgs.fira-sans}/share/fonts"
              "${pkgs.noto-fonts}/share/fonts"
              "${pkgs.font-awesome}/share/fonts"
            ];
          };
      }
    );
}
