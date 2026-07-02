#import "../../../../shared/widgets/tokens.typ": *


#let select(predicate, table, color: black) = {
  box(outset: 4pt, radius: 4pt)[
    $tokens.Select#sub[(#predicate)]$(#text(fill: color)[#table])
  ]
}

// example
// #select([name = "something"], "Table")
