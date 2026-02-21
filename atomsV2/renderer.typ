#import "parser.typ": *
#import "tokenizer.typ": tokenize

#let render-ast-node(node) = {
  if node.type == ast-node-types.text {
    return [#node.content]
  }
  
  if node.type == ast-node-types.element {
    let tag = node.tag
    let attrs = node.at("attributes", default: (:))
    let children = node.at("children", default: ())
    
    let rendered-children = ()
    for child in children {
      rendered-children = rendered-children + (render-ast-node(child),)
    }
    let content = rendered-children.join()
    
    let class-attr = attrs.at("class", default: none)
    let css-styles = parse-css-classes(class-attr)
    let typst-params = convert-layout-to-typst(css-styles)
    
    if tag == "div" {
      let result = content
      
      // CSS Box Model: Content -> Padding -> Border -> Margin (inside out)
      
      // 1. Apply padding (inset) if present
      if "padding" in typst-params {
        let padding = typst-params.at("padding")
        result = block(inset: padding, result)
      }
      
      // 2. Apply background and border with default center alignment
      let border-params = (:)
      if "fill" in typst-params { border-params.insert("fill", typst-params.at("fill")) }
      if "border" in typst-params { border-params.insert("stroke", typst-params.at("border")) }
      if "radius" in typst-params { border-params.insert("radius", typst-params.at("radius")) }
      
      result = block(..border-params, result)
      
      // Apply alignment as outer wrapper
      let alignment = center
      if "justify-content" in typst-params {
        let justify = typst-params.at("justify-content")
        if justify == "flex-start" { alignment = left }
        else if justify == "flex-end" { alignment = right }
        else if justify == "center" { alignment = center }
      }
      
      result = align(alignment, result)
      
      // 3. Apply margin (outset) if present
      if "margin" in typst-params {
        let margin = typst-params.at("margin")
        result = block(outset: margin, result)
      }
      
      return result
    } else if tag in ("h1", "h2", "h3", "h4", "h5", "h6") {
      let level = int(tag.slice(1))
      if "color" in typst-params {
        return heading(level: level, text(fill: typst-params.at("color"), content))
      } else {
        return heading(level: level, content)
      }
    } else if tag == "p" {
      if "color" in typst-params {
        return par(text(fill: typst-params.at("color"), content))
      } else {
        return par(content)
      }
    } else if tag == "span" {
      if "color" in typst-params or "size" in typst-params {
        return text(
          ..if "fill" in typst-params { (fill: typst-params.at("fill"),) } else { () },
          ..if "size" in typst-params { (size: typst-params.at("size"),) } else { () },
          content
        )
      } else {
        return content
      }
    }
    
    return content
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