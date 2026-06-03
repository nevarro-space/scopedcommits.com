Scoped Commits is a loose standard for formatting commit messages that
focuses on making the commit log quickly understandable to contributors.

Normal commit messages should be formatted as follows:

```
<scope>: <description>

[optional body]

[optional trailer(s)]
```

- `<scope>` --- the subsystem, area, or module that the commit touches.
- `<description>` --- a short description of the changes made.
- `[optional body]` --- detailed information about the changes
- `[optional trailer(s)]` --- additional metadata about the commit

Reverts, merges, and other special commits can be formatted however you like.

Projects using Scoped Commits often provide additional rules defining the valid
scopes and how to format the description, body, and trailers of the commit
message. Projects may also choose to enforce formatting rules for special
commits.

= Examples

== Linux

```
i2c: virtio: mark device ready before registering the adapter
```
#link("https://github.com/torvalds/linux/commit/1d774589f924")[View Commit]
|
#link("https://www.kernel.org/doc/html/v4.14/process/submitting-patches.html")[Formatting Documentation]

== FreeBSD

```
linuxulator: Return EINVAL for invalid inotify flags
```
#link("https://github.com/freebsd/freebsd-src/commit/f77d37cffdf3")[View Commit]
|
#link("https://freebsdfoundation.org/wp-content/uploads/2020/11/Writing-Commit-Messages.pdf")[Formatting Documentation]

== Git

```
gitlab-ci: update macOS image
```
#link("https://github.com/git/git/commit/62319b49bbe7")[View Commit]
|
#link("https://git-scm.com/docs/SubmittingPatches")[Formatting Documentation]

== Go

```
net/http/cookiejar: add godoc links
```
#link("https://github.com/golang/go/commit/517d4d3c7976")[View Commit]
|
#link("https://go.dev/wiki/CommitMessage")[Formatting Documentation]

== nixpkgs

```
xwayland: 24.1.11 -> 24.1.12
```
#link("https://github.com/NixOS/nixpkgs/commit/7bf858875a54")[View Commit]
|
#link("https://github.com/NixOS/nixpkgs/blob/master/CONTRIBUTING.md")[Formatting Documentation]

= Why Use Scoped Commits?

The _scope_ of a change (the subject of the change) is the most important part
of a commit message. To demonstrate this, let's consider why each one of the
following stakeholders care about the scope of the change:

- *Contributors:* when you are a contributor to a project, you often need to
  read the commit log to identify changes in the codebase relevant to a certain
  area of the code. There are many reasons for this including:

  - Wanting to catch up on what has happened since the last time you
    contributed.
  - Trying to understand where the project's overall inertia is.
  - Looking for commits that might conflict with your in-progress work when
    pulling or rebasing.

  As you read the commit log, you're looking at _what areas_ were touched.

- *Debuggers:* when investigating a bug, you often want to look through the
  commit log to see what changes might have touched areas related to the
  component where the bug manifested. Once again, the scope is the most
  important piece of information.

- *Incident responders:* when production is down, scanning the commit log for
  changes that were made around the time of the outage is an effective way to
  identify what areas may be causing the problem. Scope is once again the most
  important piece of information you can have at this point. For example, if you
  see a commit related to the `auth` scope at the tip of the spike of inbound
  API errors, it's a likely culprit for the problem.

Scoped Commits puts the most important part of the commit message up front,
making it easy for all stakeholders to quickly scan the commit log and identify
relevant changes.

= FAQ

== What about Conventional Commits?

- #link(
    "https://sumnerevans.com/posts/software-engineering/stop-using-conventional-commits/",
  )[Stop Using Conventional Commits - Sumner Evans]
- #link(
    "https://richvdh.org/conventional-commits-considered-harmful.html",
  )[Conventional Commits, considered harmful - richvdh.org]
- #link("https://lr0.org/blog/p/cc/")[Conventional Commits considered harmful | La Vita Nouva]

== How do I generate a changelog using Scoped Commits?

*Don't.* Commit logs and changelogs serve different audiences. Commit logs are
for contributors who need to understand how the codebase evolved. Changelogs are
for users who need to understand what changed between releases. Here are a
number of articles which concur with this point:

- #link(
    "https://keepachangelog.com/en/1.0.0/#log-diffs",
  )[Keep a Changelog: Don't let your friends dump git logs into changelogs]
- #link("https://agateau.com/2022/your-git-log-is-not-a-changelog/")[Your git log is not a changelog! | agateau.com]
- #link("https://sophiabits.com/blog/conventional-changelogs-suck")[Conventional changelogs suck | Sophia Willows]
- #link(
    "https://common-changelog.org/#41-verbatim-copying-of-content",
  )[Common Changelog #sym.section 4.1: Verbatim copying of content]

== What if my commit covers multiple scopes?

If your commit covers multiple scopes, you can try one of the following approaches:

- Use a more general scope that encompasses all the relevant scopes.
- List both scopes, separated by a comma.
- If the commit touches the entire tree, you can use a scope such as `treewide`,
  `all`, or `global`.

If all else fails, just call the commit a "special commit", ignore the scope,
and write a good description.

== How does Scoped Commits handle revert commits?

Revert commits can be formatted however you like. You can use the default Git
format for revert commits, or you can use a custom format that includes the
scope of the original commit being reverted.

== Where should I put the ticket number?

Often, commits need to be associated with a Jira or Linear ticket. This is often
done by including the ticket number in the commit message. You can put it
anywhere you want within the message, however here are a few suggestions:

- Include it in parentheses after the scope. For example:
  ```
  auth (TICKET-123): fix login bug

  This commit fixes the login bug by...
  ```
- Include it in the body/trailer of the commit message. For example:

  ```
  auth: fix login bug

  This commit fixes the login bug by...

  TICKET-123
  ```
