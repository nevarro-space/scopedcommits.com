{
  description = "Scoped Commits Website";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    typix = {
      url = "github:loqusion/typix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      typix,
      flake-parts,
    }:
    (flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        {
          pkgs,
          system,
          ...
        }:
        let
          typixLib = typix.lib.${system};
          src = typixLib.cleanTypstSource ./.;
          commonArgs = {
            typstSource = "index.typ";

            typstOpts = {
              features = "html";
              format = "html";
            };

            virtualPaths = [
              {
                src = ./style.css;
                dest = "style.css";
              }
            ];
          };
          typstOutput = typixLib.buildTypstProject (commonArgs // { inherit src; });
        in
        {
          packages.default = pkgs.runCommand "scopedcommits-minified" { } ''
            ${pkgs.minify}/bin/minify ${typstOutput} --type html -o $out/index.html
          '';

          formatter = pkgs.writeShellScriptBin "fmt" ''
            exec ${pkgs.typstyle}/bin/typstyle --inplace *.typ
          '';

          devShells.default = typixLib.devShell {
            packages = [
              (typixLib.watchTypstProject commonArgs) # typst-watch
            ];
          };
        };
    });
}
