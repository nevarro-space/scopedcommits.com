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

#table(
  columns: 2,
  table.header([*Example*], [*From*]),
  [
    ```
    i2c: virtio: mark device ready before registering the adapter
    ```
  ],
  [#link("https://github.com/torvalds/linux/commit/1d774589f924")[Linux]],

  [
    ```
    linuxulator: Return EINVAL for invalid inotify flags
    ```
  ],
  [#link(
    "https://github.com/freebsd/freebsd-src/commit/f77d37cffdf3",
  )[FreeBSD]],

  [
    ```
    gitlab-ci: update macOS image
    ```
  ],
  [#link("https://github.com/git/git/commit/62319b49bbe7")[Git]],

  [
    ```
    net/http/cookiejar: add godoc links
    ```
  ],
  [#link("https://github.com/golang/go/commit/517d4d3c7976")[Go]],

  [
    ```
    xwayland: 24.1.11 -> 24.1.12
    ```
  ],
  [#link("https://github.com/NixOS/nixpkgs/commit/7bf858875a54")[nixpkgs]],
)
