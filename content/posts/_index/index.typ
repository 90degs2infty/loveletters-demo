#import "@loveletters/loveletters:0.1.0": abs_path
#import "@loveletters/template:0.1.0": toplevel_template

#show: toplevel_template


#let list_entry_post(page) = {
  let path = abs_path(("posts",), page.at(0))
  let frontmatter = page.at(1).frontmatter
  [
    #link(path)[#eval(frontmatter.title, mode: "markup")]

    published on #frontmatter.publication.display("[month repr:long] [day], [year]")
  ]
}

#list(
  ..loveletters
    .project
    .content
    .subsections
    .posts
    .pages
    .pairs()
    .sorted(key: it => it.at(1).frontmatter.publication, by: (l, r) => l >= r)
    .map(list_entry_post),
)
