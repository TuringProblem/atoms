#import "grammar.typ": *
#import "atoms-tokenizer.typ": *

#let atoms-ast-types = (
  element: "atoms-element",
  text: "atoms-text"
)

#let create-atoms-ast(type, tag: none, classes: none, content-blocks: none, text: none) = (
  type: type,
  tag: tag,
  classes: classes,
  content-blocks: content-blocks,
  text: text
)

#let parse-atoms-tokens(tokens) = {
  let ast = ()
  let index = 0
  
  while index < tokens.len() {
    let token = tokens.at(index)
    
    if token.type == atoms-tokens.open-bracket {
      // Parse element: < tag classes? -> {content} -> {more content} >
      index += 1 // Skip <
      
      if index >= tokens.len() { break }
      
      // Get tag
      let tag-token = tokens.at(index)
      if tag-token.type != atoms-tokens.tag { 
        index += 1
        continue 
      }
      let tag-name = tag-token.value
      index += 1
      
      // Skip whitespace
      while index < tokens.len() and tokens.at(index).value.trim() == "" {
        index += 1
      }
      
      // Get classes (optional)
      let classes = none
      if index < tokens.len() and tokens.at(index).type == atoms-tokens.classes {
        classes = tokens.at(index).value
        index += 1
      }
      
      // Parse content blocks
      let content-blocks = ()
      
      while index < tokens.len() {
        let current-token = tokens.at(index)
        
        // Skip whitespace
        if current-token.value.trim() == "" {
          index += 1
          continue
        }
        
        // Look for ->
        if current-token.type == atoms-tokens.arrow {
          index += 1 // Skip ->
          
          // Skip whitespace after ->
          while index < tokens.len() and tokens.at(index).value.trim() == "" {
            index += 1
          }
          
          // Expect {
          if index < tokens.len() and tokens.at(index).type == atoms-tokens.open-brace {
            index += 1 // Skip {
            
            // Collect content until }
            let content-text = ""
            let brace-depth = 1
            
            while index < tokens.len() and brace-depth > 0 {
              let content-token = tokens.at(index)
              
              if content-token.type == atoms-tokens.open-brace {
                brace-depth += 1
                content-text += "{"
              } else if content-token.type == atoms-tokens.close-brace {
                brace-depth -= 1
                if brace-depth > 0 {
                  content-text += "}"
                }
              } else {
                content-text += content-token.value
              }
              
              index += 1
            }
            
            // Add content block
            if content-text.trim() != "" {
              content-blocks = content-blocks + (content-text,)
            }
          }
          
        } else if current-token.type == atoms-tokens.close-bracket {
          index += 1 // Skip >
          break
        } else {
          index += 1
        }
      }
      
      let element = create-atoms-ast(
        atoms-ast-types.element,
        tag: tag-name,
        classes: classes,
        content-blocks: content-blocks
      )
      
      ast = ast + (element,)
      
    } else if token.type == atoms-tokens.content and token.value.trim() != "" {
      // Plain text content (outside elements)
      let text-node = create-atoms-ast(atoms-ast-types.text, text: token.value)
      ast = ast + (text-node,)
      index += 1
    } else {
      index += 1
    }
  }
  
  ast
}