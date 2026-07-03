
#let parser(tokens, seperator: "") = {
  let lexemes = tokens.split(seperator).map(str => str.trim())
  let cleanedTokens = clean(lexemes.map(lexeme => {
  lexeme}));


  cleanedTokens

}

