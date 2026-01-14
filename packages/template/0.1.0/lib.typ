#import "@loveletters/loveletters:0.1.0": abs_path, get_frontmatter

// template

#let navbar() = {
  html.nav[
    #link(loveletters.project.config.root.path)[Home] -- #link(abs_path(("posts",), none))[Posts] -- #link(abs_path(
      (),
      "about",
    ))[About]
  ]
}

#let skeleton(content) = {
  let frontmatter = get_frontmatter()

  set document(
    author: loveletters.project.config.author,
    date: frontmatter.publication,
    title: eval(frontmatter.title, mode: "markup")
      + " | "
      + loveletters.project.config.title
      + " by "
      + loveletters.project.config.author,
  )

  [
    #navbar()

    #content

    #html.hr()

    #sym.copyright #datetime.today().year() #loveletters.project.config.author

    Powered by #link("https://github.com/90degs2infty/loveletters")[`loveletters`].
  ]
}

#let post_template(doc) = {
  let frontmatter = get_frontmatter()

  skeleton([
    #html.h1(eval(frontmatter.title, mode: "markup"))

    #doc
  ])
}

#let toplevel_template(doc) = {
  let frontmatter = get_frontmatter()

  skeleton([
    #html.h1(eval(frontmatter.title, mode: "markup"))

    #doc
  ])
}
