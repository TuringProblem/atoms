#import "grammar.typ": *
#import "atoms-tokenizer.typ": *
#import "atoms-parser-v2.typ": *

#let render-atoms-to-html(ast-node) = {
  if ast-node.type == atoms-ast-types.text {
    return ast-node.text
  }
  
  if ast-node.type == atoms-ast-types.element {
    let tag = atoms-tags.at(ast-node.tag, default: ast-node.tag)
    let classes = if ast-node.classes != none { 
      parse-atoms-classes(ast-node.classes) 
    } else { 
      "" 
    }
    
    // Handle content block chaining
    let content-blocks = ast-node.at("content-blocks", default: ())
    
    if content-blocks.len() == 1 {
      // Single content block - normal element
      let content = content-blocks.at(0)
      // Check if content contains nested Atoms elements
      if content.contains("<") {
        content = atoms-to-html(content) // Recursively parse nested elements
      }
      
      if classes != "" {
        return "<" + tag + " class='" + classes + "'>" + content + "</" + tag + ">"
      } else {
        return "<" + tag + ">" + content + "</" + tag + ">"
      }
      
    } else if content-blocks.len() > 1 {
      // Multiple content blocks - create sibling elements
      let siblings = ""
      for content-block in content-blocks {
        let content = content-block
        if content.contains("<") {
          content = atoms-to-html(content) // Recursively parse nested elements
        }
        
        if classes != "" {
          siblings += "<" + tag + " class='" + classes + "'>" + content + "</" + tag + ">"
        } else {
          siblings += "<" + tag + ">" + content + "</" + tag + ">"
        }
      }
      return siblings
    } else {
      // No content blocks - self-closing or empty
      if classes != "" {
        return "<" + tag + " class='" + classes + "'/>"
      } else {
        return "<" + tag + "/>"
      }
    }
  }
  
  return ""
}

#let atoms-to-html(atoms-string) = {
  let ast = parse-atoms-dsl(atoms-string)
  
  let html-output = ""
  for node in ast {
    html-output += render-atoms-to-html(node)
  }
  
  html-output
}

// Main Atoms DSL function - converts Atoms -> HTML -> Typst
#import "css-renderer.typ": html as html-to-typst

#let atoms(atoms-string) = {
  let html-string = atoms-to-html(atoms-string)
  html-to-typst(html-string)
}