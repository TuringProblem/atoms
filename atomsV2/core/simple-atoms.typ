// Simplified Atoms parser - direct string manipulation

#import "grammar.typ": class-abbreviations, atoms-tags

#let expand-classes(class-string) = {
  if class-string == none or class-string.trim() == "" { return "" }
  
  let classes = class-string.split(" ")
  let expanded = ()
  
  for class in classes {
    if class in class-abbreviations {
      expanded = expanded + (class-abbreviations.at(class),)
    } else {
      expanded = expanded + (class,)
    }
  }
  
  expanded.join(" ")
}

#let css-to-typst-params(class-string) = {
  if class-string == "" { return (:) }
  
  // Define basic CSS mappings directly here for simplicity
  let basic-css-classes = (
    "p-1": (padding: 4pt), "p-2": (padding: 8pt), "p-3": (padding: 12pt), "p-4": (padding: 16pt),
    "p-5": (padding: 20pt), "p-6": (padding: 24pt), "p-8": (padding: 32pt),
    
    "m-1": (margin: 4pt), "m-2": (margin: 8pt), "m-3": (margin: 12pt), "m-4": (margin: 16pt),
    "m-5": (margin: 20pt), "m-6": (margin: 24pt),
    
    "bg-blue-100": (fill: rgb(219, 234, 254)), "bg-red-100": (fill: rgb(254, 226, 226)),
    "bg-green-100": (fill: rgb(220, 252, 231)), "bg-gray-100": (fill: rgb(243, 244, 246)),
    "bg-gray-50": (fill: rgb(249, 250, 251)), "bg-white": (fill: white),
    
    "flex": (display: "flex"), "justify-center": (justify-content: "center"),
    "justify-between": (justify-content: "space-between"), "flex-col": (flex-direction: "column"),
    
    "border": (border: 1pt + black), "rounded": (radius: 4pt), "rounded-lg": (radius: 8pt)
  )
  
  let classes = class-string.split(" ")
  let styles = (:)
  
  for class in classes {
    if class in basic-css-classes {
      let class-style = basic-css-classes.at(class)
      for (key, value) in class-style {
        styles.insert(key, value)
      }
    }
  }
  
  styles
}

#let render-atoms-element(tag, classes, content) = {
  let full-tag = atoms-tags.at(tag, default: tag)
  let expanded-classes = expand-classes(classes)
  let css-styles = css-to-typst-params(expanded-classes)
  
  if full-tag == "div" {
    let result = content
    
    // Apply CSS Box Model
    if "padding" in css-styles {
      result = block(inset: css-styles.at("padding"), result)
    }
    
    if "fill" in css-styles or "border" in css-styles {
      let params = (:)
      if "fill" in css-styles { params.insert("fill", css-styles.at("fill")) }
      if "border" in css-styles { params.insert("stroke", css-styles.at("border")) }
      if "radius" in css-styles { params.insert("radius", css-styles.at("radius")) }
      result = block(..params, result)
    }
    
    if "margin" in css-styles {
      result = block(outset: css-styles.at("margin"), result)  
    }
    
    // Apply flex layout
    if "display" in css-styles and css-styles.at("display") == "flex" {
      let justify = css-styles.at("justify-content", default: none)
      if justify == "center" {
        result = align(center, result)
      } else if justify == "flex-end" {
        result = align(right, result)
      } else if justify == "space-between" {
        // For now, just center - proper flex needs more work
        result = align(center, result)
      }
    } else {
      // Default center for top-level divs
      result = align(center, result)
    }
    
    return result
  }
  
  return content
}

#let atoms(atoms-string) = {
  // Ultra-simple approach: regex-based parsing for now
  let simple-div = regex("<d '([^']*)' -> \\{([^}]*)\\}>")
  let matches = atoms-string.matches(simple-div)
  
  if matches.len() > 0 {
    let match = matches.at(0)
    let classes = match.captures.at(0)
    let content = match.captures.at(1)
    
    return render-atoms-element("d", classes, [#content])
  }
  
  return [#atoms-string]
}