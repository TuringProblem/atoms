#import "grammar.typ": *
#import "atoms-tokenizer.typ": *

#let atoms-ast-types = (
  element: "atoms-element",
  text: "atoms-text",
  chain: "atoms-chain"
)

#let create-atoms-ast(type, tag: none, classes: none, content-blocks: none, text: none) = (
  type: type,
  tag: tag,
  classes: classes,
  content-blocks: content-blocks,
  text: text
)

#let parse-atoms-content-block(tokens, start-index) = {
  // Parse content inside { ... }
  if start-index >= tokens.len() { return (none, start-index) }
  
  let token = tokens.at(start-index)
  if token.type != atoms-tokens.open-brace {
    return (none, start-index)
  }
  
  let content-tokens = ()
  let index = start-index + 1
  let brace-depth = 1
  
  while index < tokens.len() and brace-depth > 0 {
    let current-token = tokens.at(index)
    
    if current-token.type == atoms-tokens.open-brace {
      brace-depth += 1
    } else if current-token.type == atoms-tokens.close-brace {
      brace-depth -= 1
    }
    
    if brace-depth > 0 {
      content-tokens = content-tokens + (current-token,)
    }
    
    index += 1
  }
  
  // For now, convert content tokens to simple text
  let parsed-content = ()
  for token in content-tokens {
    if token.type == atoms-tokens.content {
      parsed-content = parsed-content + (create-atoms-ast(atoms-ast-types.text, text: token.value),)
    }
  }
  
  (parsed-content, index)
}

#let parse-atoms-element(tokens, start-index) = {
  if start-index >= tokens.len() { return (none, start-index) }
  
  let index = start-index
  let token = tokens.at(index)
  
  // Expect <
  if token.type != atoms-tokens.open-bracket {
    return (none, index)
  }
  index += 1
  
  // Expect tag
  if index >= tokens.len() { return (none, index) }
  let tag-token = tokens.at(index) 
  if tag-token.type != atoms-tokens.tag {
    return (none, index)
  }
  let tag-name = tag-token.value
  index += 1
  
  // Optional classes
  let classes = none
  if index < tokens.len() and tokens.at(index).type == atoms-tokens.classes {
    classes = tokens.at(index).value
    index += 1
  }
  
  // Parse content blocks (can be multiple with -> chaining)
  let content-blocks = ()
  
  while index < tokens.len() {
    let current-token = tokens.at(index)
    
    if current-token.type == atoms-tokens.arrow {
      index += 1 // Skip ->
      
      let (content-block, next-index) = parse-atoms-content-block(tokens, index)
      if content-block != none {
        content-blocks = content-blocks + (content-block,)
      }
      index = next-index
    } else if current-token.type == atoms-tokens.close-bracket {
      index += 1 // Skip >
      break
    } else {
      break
    }
  }
  
  let element = create-atoms-ast(
    atoms-ast-types.element,
    tag: tag-name,
    classes: classes,
    content-blocks: content-blocks
  )
  
  (element, index)
}

#let parse-atoms-tokens(tokens) = {
  let ast = ()
  let index = 0
  
  while index < tokens.len() {
    let token = tokens.at(index)
    
    if token.type == atoms-tokens.open-bracket {
      let (element, next-index) = parse-atoms-element(tokens, index)
      if element != none {
        ast = ast + (element,)
      }
      index = next-index
    } else if token.type == atoms-tokens.content {
      // Plain text content
      let text-node = create-atoms-ast(atoms-ast-types.text, text: token.value)
      ast = ast + (text-node,)
      index += 1
    } else {
      index += 1
    }
  }
  
  ast
}