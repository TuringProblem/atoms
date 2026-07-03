#import "../../../../shared/widgets/tokens.typ": *


#let select(predicate, table, color: black, varName: "") = {
  if varName != "" {
    box(outset: 4pt, radius: 4pt)[
      #varName #tokens.AssignmentOperator #text(fill: color)[$tokens.Select#sub[(#predicate)]$(#text(fill: color)[#table])]
    ]
  } else {
    box(outset: 4pt, radius: 4pt)[
      $tokens.Select#sub[(#predicate)]$(#text(fill: color)[#table])
    ]
  }
}

// example
#select([name = "something" #tokens.And something = "else"], "Table")

#select([name = "something"], "Table", varName: "A")
