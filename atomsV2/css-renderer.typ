#import "parser.typ": *
#import "tokenizer.typ": tokenize

#let render-ast-node(node, parent-context: none) = {
  if node.type == ast-node-types.text {
    return [#node.content]
  }
  
  if node.type == ast-node-types.element {
    let tag = node.tag
    let attrs = node.at("attributes", default: (:))
    let children = node.at("children", default: ())
    
    let class-attr = attrs.at("class", default: none)
    let css-styles = parse-css-classes(class-attr)
    let typst-params = convert-layout-to-typst(css-styles)
    
    // Determine display mode for this element
    let display-mode = "block"
    if "display" in css-styles {
      display-mode = css-styles.at("display")
    }
    
    // Create context for children
    let child-context = (
      display: display-mode,
      justify: css-styles.at("justify-content", default: none),
      align-items: css-styles.at("align-items", default: none),
      flex-direction: css-styles.at("flex-direction", default: "row")
    )
    
    if tag == "div" {
      let result = none
      
      if display-mode == "flex" {
        // Render as flex container
        let flex-children = ()
        for child in children {
          flex-children = flex-children + (render-ast-node(child, parent-context: child-context),)
        }
        
        // Apply flex layout with proper justify-content
        let stack-params = (:)
        let direction = if child-context.flex-direction == "column" { ttb } else { ltr }
        stack-params.insert("dir", direction)
        
        // Handle justify-content properly
        if child-context.justify == "center" {
          // Center children in container
          if direction == ttb {
            result = align(center + horizon, stack(dir: direction, ..flex-children))
          } else {
            result = align(center, stack(dir: direction, ..flex-children))
          }
        } else if child-context.justify == "flex-end" {
          // Push children to end
          if direction == ttb {
            result = align(bottom, stack(dir: direction, ..flex-children))
          } else {
            result = align(right, stack(dir: direction, ..flex-children))
          }
        } else if child-context.justify == "space-between" {
          // Distribute children with space between
          if flex-children.len() > 1 {
            let container-width = 100%
            let spacing = if direction == ttb { 1fr } else { 1fr }
            
            // Create justified layout
            if direction == ttb {
              result = stack(dir: ttb, 
                flex-children.at(0),
                v(1fr),
                ..flex-children.slice(1, -1).map(child => (child, v(1fr))).flatten(),
                flex-children.at(-1)
              )
            } else {
              let spaced-children = ()
              for (i, child) in flex-children.enumerate() {
                spaced-children.push(child)
                if i < flex-children.len() - 1 {
                  spaced-children.push(h(1fr))
                }
              }
              result = box(width: 100%, stack(dir: ltr, ..spaced-children))
            }
          } else {
            result = stack(dir: direction, ..flex-children)
          }
        } else {
          // Default: flex-start
          result = stack(dir: direction, ..flex-children)
        }
        
      } else {
        // Render as block container
        let block-children = ()
        for child in children {
          block-children = block-children + (render-ast-node(child, parent-context: child-context),)
        }
        result = block-children.join()
        
        // Apply text alignment only for block context
        if parent-context == none or parent-context.display != "flex" {
          // Default center alignment only for top-level elements
          if parent-context == none {
            result = align(center, result)
          }
        }
      }
      
      // Apply CSS Box Model: Content -> Padding -> Border -> Margin
      
      // 1. Apply padding
      if "padding" in typst-params {
        let padding = typst-params.at("padding")
        result = block(inset: padding, result)
      }
      
      // 2. Apply background and border
      let border-params = (:)
      if "fill" in typst-params { border-params.insert("fill", typst-params.at("fill")) }
      if "border" in typst-params { border-params.insert("stroke", typst-params.at("border")) }
      if "radius" in typst-params { border-params.insert("radius", typst-params.at("radius")) }
      
      if border-params.len() > 0 {
        result = block(..border-params, result)
      }
      
      // 3. Apply margin
      if "margin" in typst-params {
        let margin = typst-params.at("margin")
        result = block(outset: margin, result)
      }
      
      return result
      
    } else if tag in ("h1", "h2", "h3", "h4", "h5", "h6") {
      let level = int(tag.slice(1))
      let rendered-children = ()
      for child in children {
        rendered-children = rendered-children + (render-ast-node(child, parent-context: parent-context),)
      }
      let content = rendered-children.join()
      
      if "color" in typst-params {
        return heading(level: level, text(fill: typst-params.at("color"), content))
      } else {
        return heading(level: level, content)
      }
    } else if tag == "p" {
      let rendered-children = ()
      for child in children {
        rendered-children = rendered-children + (render-ast-node(child, parent-context: parent-context),)
      }
      let content = rendered-children.join()
      
      if "color" in typst-params {
        return par(text(fill: typst-params.at("color"), content))
      } else {
        return par(content)
      }
    } else if tag == "br" {
      return linebreak()
    } else if tag == "hr" {
      return line(length: 100%)
    }
    
    // Default: render children and return content
    let rendered-children = ()
    for child in children {
      rendered-children = rendered-children + (render-ast-node(child, parent-context: parent-context),)
    }
    return rendered-children.join()
  }
  
  return []
}

#let html(content) = {
  let tokens = tokenize(content)
  let ast = parse-tokens(tokens)
  
  let rendered = ()
  for node in ast {
    rendered = rendered + (render-ast-node(node),)
  }
  
  rendered.join()
}