// DISREGARD THIS FILE - THIS IS JUST FOR ME (BRAINSTORMING lol)
#import "../atoms/join/normal/normal.join.typ": *
#import "../atoms/join/theta/theta.join.typ": *
#import "../atoms/project/project.typ": *
#import "../atoms/select/select.typ": *


// how do we want to structure this?



#let args = (
  "Table 1",
  "Table 2",
)


#let args = "
A = PROJ(name)(Table)
SELECT(name = A.name)(A)
"


#let clean(tokens) = { return tokens.filter(token => token != "") }


#let parser(tokens, seperator: "") = {
  let lexemes = tokens.split(seperator).map(str => str.trim())
  let cleanedTokens = clean(lexemes.map(lexeme => {
  lexeme}));


  cleanedTokens

}


#parser(args)
