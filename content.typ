= Summary

Scoped Commits is a loose standard for formatting commit messages that
focuses on making the commit log quickly understandable to contributors.

Normal commit messages should be formatted as follows:

```
<scope>: <description>

[optional body]

[optional trailer(s)]
```

- `<scope>` --- the subystem, area, or module that the commit touches
- `<description>` --- a short description of the changes made
- `[optional body]` --- detailed information about the changes
- `[optional trailers(s)]` --- additional metadata about the commit

Reverts, merges, and other special commits can be formatted however you like.

= Examples

== Linux

```
i2c: virtio: mark device ready before registering the adapter
```
#link("https://github.com/torvalds/linux/commit/1d774589f924")[View Commit]
#sym.dot
#link("https://www.kernel.org/doc/html/v4.14/process/submitting-patches.html")[Formatting Documentation]

== FreeBSD

```
linuxulator: Return EINVAL for invalid inotify flags
```
#link("https://github.com/freebsd/freebsd-src/commit/f77d37cffdf3")[View Commit]
#sym.dot
#link("https://freebsdfoundation.org/wp-content/uploads/2020/11/Writing-Commit-Messages.pdf")[Formatting Documentation]

== Git

```
gitlab-ci: update macOS image
```
#link("https://github.com/git/git/commit/62319b49bbe7")[View Commit]
#sym.dot
#link("https://git-scm.com/docs/SubmittingPatches")[Formatting Documentation]

== Go

```
net/http/cookiejar: add godoc links
```
#link("https://github.com/golang/go/commit/517d4d3c7976")[View Commit]
#sym.dot
#link("https://go.dev/wiki/CommitMessage")[Formatting Documentation]

== nixpkgs

```
xwayland: 24.1.11 -> 24.1.12
```
#link("https://github.com/NixOS/nixpkgs/commit/7bf858875a54")[View Commit]
#sym.dot
#link("https://github.com/NixOS/nixpkgs/blob/master/CONTRIBUTING.md")[Formatting Documentation]
