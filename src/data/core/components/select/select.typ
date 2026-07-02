#import "../../../../shared/widgets/tokens.typ": *


#let select(predicate, table, color: rgb(15, 160, 255)) = {
  box(outset: 4pt, radius: 4pt)[
    ($tokens.Select_#predicate$(#text(fill: color)[#emph[#table]]))
  ]
}

// example
// #select([name = "something"], "Table")
