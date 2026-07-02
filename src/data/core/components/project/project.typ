#import "../../../../shared/widgets/tokens.typ": *
#import "../select/select.typ": *

#let project(..args, table, color: black, varName: "") = {
  if varName != "" {
    box(outset: 4pt, radius: 4pt)[
      #varName #tokens.AssignmentOperator #text(fill: color)[$#tokens.Projection#sub[(#args.pos().join(", "))]$(#text(fill:  color)[#table])]
    ]
  } else {
    box(outset: 4pt, radius: 4pt)[
      $#tokens.Projection#sub[(#args.pos().join(", "))]$(#text(fill:  color)[#table])
    ]
  }
}

#let args = (
"two",
"three",
)

// example
#project(..args, [#select([name = "Something"], "Table", color: red)])

