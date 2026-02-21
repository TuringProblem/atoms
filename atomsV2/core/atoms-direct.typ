#import "grammar.typ": *
#import "atoms-parser-v2.typ": *
#import "tokenizer.typ": all-css-classes

// Direct Atoms -> Typst renderer (no HTML middleman)

#let render-element-with-styles(tag, css-styles, content, child-context) = {
  if tag == "div" {
    let result = content
    let display-mode = css-styles.at("display", default: "block")
    
    if display-mode == "flex" {
      // Handle flex container
      if child-context.flex-direction == "column" {
        if child-context.justify == "center" {
          result = align(center + horizon, stack(dir: ttb, result))
        } else if child-context.justify == "flex-end" {
          result = align(bottom, stack(dir: ttb, result))
        } else {
          result = stack(dir: ttb, result)
        }
      } else {
        if child-context.justify == "center" {
          result = align(center, stack(dir: ltr, result))
        } else if child-context.justify == "flex-end" {
          result = align(right, stack(dir: ltr, result))
        } else if child-context.justify == "space-between" {
          result = align(center, stack(dir: ltr, result)) // Simplified for now
        } else {
          result = stack(dir: ltr, result)
        }
      }
    }
    
    // Apply CSS Box Model: Content -> Padding -> Border -> Margin
    
    // 1. Apply padding
    if "padding" in css-styles {
      result = block(inset: css-styles.at("padding"), result)
    }
    
    // 2. Apply background and border
    let border-params = (:)
    if "fill" in css-styles { border-params.insert("fill", css-styles.at("fill")) }
    if "border" in css-styles { border-params.insert("stroke", css-styles.at("border")) }
    if "radius" in css-styles { border-params.insert("radius", css-styles.at("radius")) }
    
    if border-params.len() > 0 {
      result = block(..border-params, result)
    }
    
    // 3. Apply margin  
    if "margin" in css-styles {
      result = block(outset: css-styles.at("margin"), result)
    }
    
    // Default center alignment for top-level elements
    if child-context == none {
      result = align(center, result)
    }
    
    return result
    
  } else if tag in ("h1", "h2", "h3", "h4", "h5", "h6") {
    let level = int(tag.slice(1))
    if "color" in css-styles {
      return heading(level: level, text(fill: css-styles.at("color"), content))
    } else {
      return heading(level: level, content)
    }
  } else if tag == "p" {
    if "color" in css-styles {
      return par(text(fill: css-styles.at("color"), content))
    } else {
      return par(content)
    }
  }
  
  return content
}

#let render-atoms-direct(ast-node, parent-context: none) = {
  if ast-node.type == atoms-ast-types.text {
    return [#ast-node.text]
  }
  
  if ast-node.type == atoms-ast-types.element {
    let tag = atoms-tags.at(ast-node.tag, default: "div")
    let classes = ast-node.at("classes", default: none)
    let content-blocks = ast-node.at("content-blocks", default: ())
    
    // Parse abbreviations to full Tailwind classes
    let full-classes = if classes != none { parse-atoms-classes(classes) } else { "" }
    
    // Convert to CSS styles (reuse existing logic)
    let css-styles = (:)
    if full-classes != "" {
      let class-list = full-classes.split(" ")
      for class in class-list {
        if class in all-css-classes {
          let class-style = all-css-classes.at(class)
          for (key, value) in class-style {
            css-styles.insert(key, value)
          }
        }
      }
    }
    
    // Determine display mode
    let display-mode = css-styles.at("display", default: "block")
    
    // Create context for children
    let child-context = (
      display: display-mode,
      justify: css-styles.at("justify-content", default: none),
      flex-direction: css-styles.at("flex-direction", default: "row")
    )
    
    // Handle content block chaining
    if content-blocks.len() == 1 {
      // Single content block
      let content = content-blocks.at(0)
      // Parse nested Atoms elements in content
      if content.contains("<") {
        let nested-ast = parse-atoms-dsl(content)
        let nested-content = ()
        for nested-node in nested-ast {
          nested-content = nested-content + (render-atoms-direct(nested-node, parent-context: child-context),)
        }
        content = nested-content.join()
      } else {
        content = [#content]
      }
      
      return render-element-with-styles(tag, css-styles, content, child-context)
      
    } else if content-blocks.len() > 1 {
      // Multiple content blocks - create sibling elements
      let siblings = ()
      for content-block in content-blocks {
        let content = content-block
        if content.contains("<") {
          let nested-ast = parse-atoms-dsl(content)
          let nested-content = ()
          for nested-node in nested-ast {
            nested-content = nested-content + (render-atoms-direct(nested-node, parent-context: child-context),)
          }
          content = nested-content.join()
        } else {
          content = [#content]
        }
        
        siblings = siblings + (render-element-with-styles(tag, css-styles, content, child-context),)
      }
      return siblings.join()
    }
  }
  
  return []
}


#let atoms(atoms-string) = {
  let ast = parse-atoms-dsl(atoms-string)
  
  let rendered = ()
  for node in ast {
    rendered = rendered + (render-atoms-direct(node),)
  }
  
  rendered.join()
}