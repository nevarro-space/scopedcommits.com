#set document(title: "Scoped Commits")

#html.html([
  #html.head([
    #html.title("Scoped Commits")
    #html.meta(charset: "utf-8")
    #html.style(read("style.css"))
    #html.elem("script", attrs: (
      "data-goatcounter": "https://stats.scopedcommits.com/count",
      async: "async",
      src: "//stats.scopedcommits.com/count.js",
    ))
  ])
  #html.body([
    #html.div(class: "container", [
      #html.header([
        #title()

        == A commit format focused on what matters
      ])

      #html.main(include "content.typ")

      #html.footer([
        #html.small([
          #sym.copyright 2026
          #link("https://nevarro.space")[Nevarro LLC].
          All rights reserved.
          #link("https://github.com/nevarro-space/scopedcommits.com")[Source Code].
        ])
      ])
    ])
  ])
])
