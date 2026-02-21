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

#let parse-content-block(atoms-string, start-pos) = {
  // Parse content inside { ... }, which can contain nested Atoms elements
  // start-pos should be right after the opening {
  let brace-depth = 1  // We're already inside one brace
  let current-pos = start-pos
  let content = ""
  
  while current-pos < atoms-string.len() {
    let char = atoms-string.at(current-pos)
    
    if char == "{" {
      brace-depth += 1
      content += char
    } else if char == "}" {
      brace-depth -= 1
      if brace-depth == 0 {
        // End of this content block
        return (content.trim(), current-pos + 1)
      } else {
        content += char
      }
    } else {
      content += char
    }
    
    current-pos += 1
  }
  
  (content.trim(), current-pos)
}

#let parse-atoms-dsl(atoms-string) = {
  let elements = ()
  let current-pos = 0
  
  while current-pos < atoms-string.len() {
    // Find next element start
    let remaining = atoms-string.slice(current-pos)
    let element-start-offset = remaining.position("<")
    if element-start-offset == none { break }
    let element-start = current-pos + element-start-offset
    
    // Add any text before this element
    if element-start > current-pos {
      let text-content = atoms-string.slice(current-pos, element-start).trim()
      if text-content != "" {
        elements = elements + (create-atoms-ast(atoms-ast-types.text, text: text-content),)
      }
    }
    
    current-pos = element-start + 1 // Skip <
    
    // Parse tag name
    let tag-remaining = atoms-string.slice(current-pos)
    let space-pos = tag-remaining.position(" ")
    let quote-pos = tag-remaining.position("'")
    let bracket-pos = tag-remaining.position(">")
    
    let tag-end-offset = none
    if space-pos != none { tag-end-offset = space-pos }
    if quote-pos != none and (tag-end-offset == none or quote-pos < tag-end-offset) { tag-end-offset = quote-pos }
    if bracket-pos != none and (tag-end-offset == none or bracket-pos < tag-end-offset) { tag-end-offset = bracket-pos }
    
    if tag-end-offset == none { break }
    let tag-end = current-pos + tag-end-offset
    if tag-end == none { break }
    
    let tag-name = atoms-string.slice(current-pos, tag-end).trim()
    current-pos = tag-end
    
    // Skip whitespace
    while current-pos < atoms-string.len() and atoms-string.at(current-pos) == " " {
      current-pos += 1
    }
    
    // Parse classes (optional)
    let classes = none
    if current-pos < atoms-string.len() and atoms-string.at(current-pos) == "'" {
      let class-start = current-pos + 1
      let class-remaining = atoms-string.slice(class-start)
      let class-end-offset = class-remaining.position("'")
      let class-end = if class-end-offset != none { class-start + class-end-offset } else { none }
      if class-end != none {
        classes = atoms-string.slice(class-start, class-end)
        current-pos = class-end + 1
      }
    }
    
    // Parse content blocks (-> {content} -> {more content})
    let content-blocks = ()
    
    while current-pos < atoms-string.len() {
      // Skip whitespace
      while current-pos < atoms-string.len() and atoms-string.at(current-pos) == " " {
        current-pos += 1
      }
      
      // Look for ->
      if current-pos + 1 < atoms-string.len() and atoms-string.slice(current-pos, current-pos + 2) == "->" {
        current-pos += 2 // Skip ->
        
        // Skip whitespace
        while current-pos < atoms-string.len() and atoms-string.at(current-pos) == " " {
          current-pos += 1
        }
        
        // Expect {
        if current-pos < atoms-string.len() and atoms-string.at(current-pos) == "{" {
          current-pos += 1 // Skip {
          let (content, next-pos) = parse-content-block(atoms-string, current-pos)
          content-blocks = content-blocks + (content,)
          current-pos = next-pos
        }
      } else if current-pos < atoms-string.len() and atoms-string.at(current-pos) == ">" {
        current-pos += 1 // Skip >
        break
      } else {
        current-pos += 1
      }
    }
    
    elements = elements + (create-atoms-ast(
      atoms-ast-types.element,
      tag: tag-name,
      classes: classes,
      content-blocks: content-blocks
    ),)
  }
  
  elements
}