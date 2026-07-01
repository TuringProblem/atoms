#let tokens = (
  "Select": $\u{03C3}$,
  "Projection": $pi$,
  "Rename": $\u{03C1}$,
  "AssignmentOperator": $arrow.l.long$,
  "CartesianProduct": $\u{00D7}$, 
  "Join": ("theta": $theta$, "normal": $\u{22C8}$), 
  "Intersection": $inter$,
  "SetDif": $dash.en$,
  "Union": $union$,
  "And": $and$,
  "Or": $or$,
)

#tokens.at("CartesianProduct")

#let nj = tokens.at("Join").at("normal")

1. #emph[value] #tokens.at("AssignmentOperator") Table #nj Table ... 
2. #emph[value] #tokens.at("AssignmentOperator") Table #nj Table ... 
3. 





