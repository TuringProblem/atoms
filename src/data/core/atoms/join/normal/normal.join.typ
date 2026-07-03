#import "../../../../../shared/widgets/tokens.typ": *

#let normalJoin(..tables, color: black, varName: "") = {
if varName != "" {
    box(outset: 4pt, radius: 4pt)[
       #varName #tokens.AssignmentOperator #text(fill:  color)[#tables.pos().join([#text(fill: color)[ #tokens.Join.normal ]])]
    ]
  } else {
    box(outset: 4pt, radius: 4pt)[
      #text(fill:  color)[#tables.pos().join([#text(fill: color)[ #tokens.Join.normal ]])]
    ]
  }

}

// example

// example
#let args = (
  "Table 1",
  "Table 2",
)


// example
#normalJoin(..args, varName: "A")

