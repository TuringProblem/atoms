#import "tokenizer.typ": *

#let ast-node-types = (
  element: "element",
  text: "text"
)

#let create-ast-node(type, tag: none, attributes: none, children: none, content: none) = (
  type: type,
  tag: tag,
  attributes: attributes,
  children: children,
  content: content
)

#let parse-css-classes(class-string) = {
  if class-string == none { return (:) }
  
  let classes = class-string.split(" ")
  let styles = (:)
  
  for class in classes {
    if class in all-css-classes {
      let class-style = all-css-classes.at(class)
      for (key, value) in class-style {
        styles.insert(key, value)
      }
    }
  }
  
  styles
}

#let typst-layout-mapping = (
  flex: (display: "flex"),
  "flex-col": (direction: "column"),
  "flex-row": (direction: "row"),
  "justify-center": (alignment: horizon),
  "items-center": (alignment: horizon),
  "text-center": (align: center)
)

#let convert-layout-to-typst(styles) = {
  let typst-params = (:)
  
  if "display" in styles and styles.at("display") == "flex" {
    typst-params.insert("flex", true)
    
    if "flex-direction" in styles {
      if styles.at("flex-direction") == "column" {
        typst-params.insert("dir", ttb)
      } else {
        typst-params.insert("dir", ltr) 
      }
    }
    
    if "justify-content" in styles {
      let justify = styles.at("justify-content")
      if justify == "center" {
        typst-params.insert("alignment", center)
      } else if justify == "flex-end" {
        typst-params.insert("alignment", right)
      }
    }
  }
  
  // Handle padding
  if "padding" in styles {
    typst-params.insert("padding", styles.at("padding"))
  } else {
    let padding-dict = (:)
    if "padding-top" in styles { padding-dict.insert("top", styles.at("padding-top")) }
    if "padding-bottom" in styles { padding-dict.insert("bottom", styles.at("padding-bottom")) }
    if "padding-left" in styles { padding-dict.insert("left", styles.at("padding-left")) }
    if "padding-right" in styles { padding-dict.insert("right", styles.at("padding-right")) }
    
    if padding-dict.len() > 0 {
      typst-params.insert("padding", padding-dict)
    }
  }
  
  // Handle margin
  if "margin" in styles {
    typst-params.insert("margin", styles.at("margin"))
  } else {
    let margin-dict = (:)
    if "margin-top" in styles { margin-dict.insert("top", styles.at("margin-top")) }
    if "margin-bottom" in styles { margin-dict.insert("bottom", styles.at("margin-bottom")) }
    if "margin-left" in styles { margin-dict.insert("left", styles.at("margin-left")) }
    if "margin-right" in styles { margin-dict.insert("right", styles.at("margin-right")) }
    
    if margin-dict.len() > 0 {
      typst-params.insert("margin", margin-dict)
    }
  }
  
  // Handle border
  if "border" in styles {
    typst-params.insert("border", styles.at("border"))
  }
  
  if "radius" in styles {
    typst-params.insert("radius", styles.at("radius"))
  }
  
  if "fill" in styles {
    typst-params.insert("fill", styles.at("fill"))
  }
  
  if "color" in styles {
    typst-params.insert("color", styles.at("color"))
  }
  
  if "size" in styles {
    typst-params.insert("size", styles.at("size"))
  }
  
  typst-params
}

#let parse-tokens(tokens) = {
  let stack = ()
  let current-index = 0
  
  let parse-element(start-index) = {
    if start-index >= tokens.len() {
      return (none, start-index)
    }
    
    let token = tokens.at(start-index)
    
    if token.type == token-types.text {
      return (create-ast-node(ast-node-types.text, content: token.value), start-index + 1)
    }
    
    if token.type == token-types.self-closing {
      return (create-ast-node(ast-node-types.element, tag: token.value, attributes: token.attributes, children: ()), start-index + 1)
    }
    
    if token.type == token-types.open-tag {
      let element-node = create-ast-node(ast-node-types.element, tag: token.value, attributes: token.attributes, children: ())
      let children = ()
      let index = start-index + 1
      
      while index < tokens.len() {
        let current-token = tokens.at(index)
        
        if current-token.type == token-types.close-tag and current-token.value == token.value {
          element-node.children = children
          return (element-node, index + 1)
        }
        
        let (child-node, next-index) = parse-element(index)
        if child-node != none {
          children = children + (child-node,)
        }
        index = next-index
      }
      
      element-node.children = children
      return (element-node, index)
    }
    
    return (none, start-index + 1)
  }
  
  let ast = ()
  let index = 0
  
  while index < tokens.len() {
    let (node, next-index) = parse-element(index)
    if node != none {
      ast = ast + (node,)
    }
    index = next-index
  }
  
  ast
}