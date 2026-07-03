#import "../../../../../shared/widgets/tokens.typ": *
#let thetaJoin(..tables, color: black, varName: "") = {
  let values = tables.pos()


  let body = {
    for (i, (name, predicate)) in values.enumerate() {
      text(fill: color)[#name]

      if i < values.len() - 1 { 
        [ #text()[#tokens.Join.normal#sub[(#predicate)]] ]
      }
    }
  }

  if varName != "" {
    varName; tokens.AssignmentOperator; body
  } else {
    body
  }
}

// example
#let argsTwo = (
  ([TableOne], [x =  12]),
  ([TableTwo], [y = 12]),
  ([TableThree],  []), 
)

#thetaJoin(..argsTwo, varName: "A", color: red)


// example
#thetaJoin(..argsTwo)

