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

= Motivation

Scoped Commits is a loose standard for formatting commit messages that focuses
on making the commit log easy to understand.

Variants of it are used by Linux
