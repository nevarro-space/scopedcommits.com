# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Static website for scopedcommits.com. Typst source compiled to HTML via Nix + [typix](https://github.com/loqusion/typix).

## Commands

All dev tools require the Nix dev shell (`nix develop` or direnv via `.envrc`).

| Task | Command |
|------|---------|
| Build | `nix build` — output in `./result/index.html` (includes minification) |
| Watch (live rebuild) | `typst-watch` (inside dev shell) |
| Format | `nix fmt` |

## Architecture

Three source files:
- `index.typ` — HTML layout/structure; reads `style.css` via `read("style.css")` and includes `content.typ`
- `content.typ` — page content
- `style.css` — styles (separate file, injected into `<head>` via `#html.style(read("style.css"))`)

Typst's experimental HTML export is used (`features = "html"`, `format = "html"`), so files use `#html.*` element functions rather than Typst's normal document/layout primitives.

`style.css` is provided to the Typst compiler via `virtualPaths` in `commonArgs` in `flake.nix`; it is shared by both the build and `typst-watch`.

Nix flake exposes:
- `packages.default` — typix HTML build piped through `minify`, output at `result/index.html`
- `formatter` — `typstyle --inplace *.typ` (run via `nix fmt`)
- `devShells.default` — shell with `typst-watch`
