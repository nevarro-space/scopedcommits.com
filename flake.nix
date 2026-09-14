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

          # Unpatched Iosevka Regular (latin subset) from @fontsource/iosevka,
          # pinned to a specific package version for reproducibility.
          iosevkaSrc = pkgs.fetchurl {
            url = "https://cdn.jsdelivr.net/fontsource/fonts/iosevka@5.3.0/latin-400-normal.woff2";
            hash = "sha256-7dN+/qo50AWhO34XcPQqR0z9fcIuS3CRxXg87J3Nx5Q=";
          };

          iosevkaLicense = pkgs.fetchurl {
            url = "https://raw.githubusercontent.com/be5invis/Iosevka/v34.8.1/LICENSE.md";
            hash = "sha256-S6U8fByzknmq5fjX0iBUxIXHEWmSDlo27QmLEV4uPF0=";
          };

          # Only the glyphs actually used on the page: ASCII, section/copyright
          # signs, smart quotes, and the em dash/ellipsis Typst's markup produces.
          fontUnicodeRanges = "U+0020-007E,U+00A7,U+00A9,U+2013-2014,U+2018-201A,U+201C-201E,U+2026";

          fonts = pkgs.runCommand "scopedcommits-fonts"
            {
              nativeBuildInputs = [ (pkgs.python3.withPackages (ps: [ ps.fonttools ps.brotli ])) ];
            }
            ''
              mkdir -p $out
              pyftsubset ${iosevkaSrc} \
                --unicodes="${fontUnicodeRanges}" \
                --layout-features='*' \
                --flavor=woff2 \
                --output-file=$out/Iosevka-Regular.woff2
              pyftsubset ${iosevkaSrc} \
                --unicodes="${fontUnicodeRanges}" \
                --layout-features='*' \
                --flavor=woff \
                --output-file=$out/Iosevka-Regular.woff
              cp ${iosevkaLicense} $out/LICENSE.md
            '';

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
            cp -r ${fonts} $out/fonts
          '';

          formatter = pkgs.writeShellScriptBin "fmt" ''
            exec ${pkgs.typstyle}/bin/typstyle --inplace *.typ
          '';

          devShells.default = typixLib.devShell {
            packages = [
              (typixLib.watchTypstProject (
                commonArgs
                // {
                  virtualPaths = commonArgs.virtualPaths ++ [
                    {
                      src = fonts;
                      dest = "fonts";
                    }
                  ];
                }
              )) # typst-watch
            ];
          };
        };
    });
}
