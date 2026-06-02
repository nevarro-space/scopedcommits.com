#html.html([
  #html.head([
    #html.title("Scoped Commits")
    #html.meta(charset: "utf-8")
    #html.style([
      #"
        @font-face {
          font-family: \"Iosevka\";
          font-style: normal;
          font-display: swap;
          font-weight: 400;
          src: url(https://cdn.jsdelivr.net/fontsource/fonts/iosevka@latest/latin-400-normal.woff2) format(\"woff2\"),
          url(https://cdn.jsdelivr.net/fontsource/fonts/iosevka@latest/latin-400-normal.woff) format(\"woff\");
        }

        body {
          background-color: #222;
          color: #eee;
          font-family: Iosevka, monospace;
          line-height: 1.4;
          font-size: 1.1rem;
          width: 100%;
          display: flex;
          justify-content: center;
          margin: 0;
        }

        .container {
          max-width: 800px;
          margin: 1em;
        }

        a,
        a:hover,
        a:visited,
        a:active {
          color: #84B4FF;
          text-decoration: none;
        }

        a:hover {
          text-decoration: underline;
        }

        header {
          margin-bottom: 2em;
          border-bottom: 1px solid #444;

          h1 {
            margin-bottom: 0;
          }

          h3 {
            margin-top: 0;
            color: #aaa;
          }
        }

        pre {
          font-size: 1rem;
          background-color: #333;
          padding: 1em;
          border-radius: 8px;
        }

        code {
          border-radius: 5px;
          background-color: #0005;
          padding: 1px 0.5rem;
        }

        footer {
          color: #777;
          border-top: 1px solid #444;
          text-align: center;
          margin: 2em 0;
          padding-top: 2em;
        }
      "
    ])
  ])
  #html.body([
    #html.div(class: "container", [
      #html.header([
        #html.h1("Scoped Commits")
        #html.h3("A commit format focused on what matters")
      ])
      #html.main([
        #html.h2("Summary")
        #html.p([
          Scoped Commits is a loose standard for formatting commit messages that
          focuses on making the commit log quickly understandable to
          contributors.
        ])
        #html.p([
          Normal commit messages should be formatted as follows:
        ])
        #html.pre(
          "<scope>: <description>

[optional body]

[optional trailer(s)]",
        )
        #html.ul([
          #html.li(
            [`<scope>` --- the subystem, area, or module that the commit touches],
          )
          #html.li(
            [`<description>` --- a short description of the changes made],
          )
          #html.li(
            [`[optional body]` --- detailed information about the changes],
          )
          #html.li(
            [`[optional trailers(s)]` -- additional metadata about the commit],
          )
        ])
        #html.p(
          [Reverts, merges, and other special commits can be formatted however you like.],
        )

        #html.h2("Motivation")
        #html.p([
          Scoped Commits is a loose standard for formatting commit messages that focuses on making the commit log easy to understand.

          Variants of it are used by
          Linux
        ])
      ])
      #html.footer([
        #html.small([
          #sym.copyright 2026
          #html.a(href: "https://nevarro.space", "Nevarro LLC").
          All rights reserved.
          #html.a(href: "https://github.com/nevarro-space/scopedcommits.com", "Source code").
        ])
      ])
    ])
  ])
])
