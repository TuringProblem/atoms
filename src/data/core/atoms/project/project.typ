#import "../../../../shared/widgets/tokens.typ": *
#import "../select/select.typ": *

#let project(..args, table, color: black, varName: "") = {
  if varName != "" {
    box(outset: 4pt, radius: 4pt)[
      #text(fill: color)[#varName] #tokens.AssignmentOperator $#tokens.Projection#sub[(#args.pos().join(", "))]$(#table)
    ]
  } else {
    box(outset: 4pt, radius: 4pt)[
      #text(fill: color)[$#tokens.Projection#sub[(#args.pos().join(", "))]$(#table)]
    ]
  }
}

#let args = (
"two",
"three",
)

// example {complex}
#project(..args, [#select([name = "Something"], "Table", color: red)])


#let assignment = project("useName", "table", varName: "A")


#assignment


