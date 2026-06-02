# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Static website for scopedcommits.com. Single Typst source file (`index.typ`) compiled to HTML via Nix + [typix](https://github.com/loqusion/typix).

## Commands

All dev tools require the Nix dev shell (`nix develop` or direnv via `.envrc`).

| Task | Command |
|------|---------|
| Build | `nix build` — output in `./result/` (includes minification) |
| Watch (live rebuild) | `typst-watch` (inside dev shell) |
| Format | `nix fmt` |

## Architecture

Everything lives in `index.typ`. Typst's experimental HTML export is used (`--features html --format html`), so the file uses `#html.*` element functions rather than Typst's normal document/layout primitives. No CSS files — styles are inlined via `#html.style([...])` in the `<head>`.

Font (Iosevka) is loaded from jsDelivr CDN at runtime. `fontPaths` in `commonArgs` points to the Nix-provided Iosevka for compiler font resolution; it is shared by both the build and `typst-watch`.

Nix flake exposes:
- `packages.default` — typix HTML build piped through `minify`
- `formatter` — `typstyle --inplace` (run via `nix fmt`)
- `devShells.default` — shell with `typst-watch`
