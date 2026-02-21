#let token-types = (
  open-tag: "open-tag",
  close-tag: "close-tag", 
  text: "text",
  self-closing: "self-closing"
)

#let html-elements = (
  "div": "div",
  "span": "span",
  "p": "p",
  "h1": "h1",
  "h2": "h2", 
  "h3": "h3",
  "h4": "h4",
  "h5": "h5",
  "h6": "h6",
  "section": "section",
  "article": "article",
  "header": "header",
  "footer": "footer",
  "main": "main",
  "aside": "aside",
  "nav": "nav",
  "ul": "ul",
  "ol": "ol",
  "li": "li",
  "a": "a",
  "img": "img",
  "br": "br",
  "hr": "hr"
)

#let css-layout-classes = (
  "flex": (display: "flex"),
  "flex-col": (flex-direction: "column"),
  "flex-row": (flex-direction: "row"),
  "block": (display: "block"),
  "inline": (display: "inline"),
  "inline-block": (display: "inline-block"),
  "grid": (display: "grid"),
  "hidden": (display: "none")
)

#let css-alignment-classes = (
  "justify-start": (justify-content: "flex-start"),
  "justify-center": (justify-content: "center"),
  "justify-end": (justify-content: "flex-end"),
  "justify-between": (justify-content: "space-between"),
  "justify-around": (justify-content: "space-around"),
  "justify-evenly": (justify-content: "space-evenly"),
  "items-start": (align-items: "flex-start"),
  "items-center": (align-items: "center"),
  "items-end": (align-items: "flex-end"),
  "text-left": (text-align: "left"),
  "text-center": (text-align: "center"),
  "text-right": (text-align: "right")
)

#let css-spacing-classes = (
  "p-0": (padding: 0pt),
  "p-1": (padding: 4pt),
  "p-2": (padding: 8pt),
  "p-3": (padding: 12pt),
  "p-4": (padding: 16pt),
  "p-5": (padding: 20pt),
  "p-6": (padding: 24pt),
  "p-8": (padding: 32pt),
  
  "px-1": (padding-left: 4pt, padding-right: 4pt),
  "px-2": (padding-left: 8pt, padding-right: 8pt),
  "px-3": (padding-left: 12pt, padding-right: 12pt),
  "px-4": (padding-left: 16pt, padding-right: 16pt),
  
  "py-1": (padding-top: 4pt, padding-bottom: 4pt),
  "py-2": (padding-top: 8pt, padding-bottom: 8pt),
  "py-3": (padding-top: 12pt, padding-bottom: 12pt),
  "py-4": (padding-top: 16pt, padding-bottom: 16pt),
  
  "m-0": (margin: 0pt),
  "m-1": (margin: 4pt),
  "m-2": (margin: 8pt),
  "m-3": (margin: 12pt),
  "m-4": (margin: 16pt),
  "m-5": (margin: 20pt),
  "m-6": (margin: 24pt),
  "m-8": (margin: 32pt),
  
  "mx-1": (margin-left: 4pt, margin-right: 4pt),
  "mx-2": (margin-left: 8pt, margin-right: 8pt),
  "mx-3": (margin-left: 12pt, margin-right: 12pt),
  "mx-4": (margin-left: 16pt, margin-right: 16pt),
  
  "my-1": (margin-top: 4pt, margin-bottom: 4pt),
  "my-2": (margin-top: 8pt, margin-bottom: 8pt),
  "my-3": (margin-top: 12pt, margin-bottom: 12pt),
  "my-4": (margin-top: 16pt, margin-bottom: 16pt),
  
  "border": (border: 1pt + black),
  "border-2": (border: 2pt + black),
  "border-4": (border: 4pt + black),
  "border-gray-200": (border: 1pt + rgb(229, 231, 235)),
  "border-gray-300": (border: 1pt + rgb(209, 213, 219)),
  "border-blue-200": (border: 1pt + rgb(191, 219, 254)),
  "border-red-200": (border: 1pt + rgb(252, 165, 165)),
  
  "rounded": (radius: 4pt),
  "rounded-md": (radius: 6pt),
  "rounded-lg": (radius: 8pt),
  "rounded-xl": (radius: 12pt),
  
  "space-x-1": (column-gap: 4pt),
  "space-x-2": (column-gap: 8pt),
  "space-x-4": (column-gap: 16pt),
  "space-y-1": (row-gap: 4pt),
  "space-y-2": (row-gap: 8pt),
  "space-y-4": (row-gap: 16pt)
)

#let css-color-classes = (
  "bg-red-50": (fill: rgb(254, 242, 242)),
  "bg-red-100": (fill: rgb(254, 226, 226)),
  "bg-red-200": (fill: rgb(252, 165, 165)),
  "bg-red-500": (fill: rgb(239, 68, 68)),
  
  "bg-blue-50": (fill: rgb(239, 246, 255)),
  "bg-blue-100": (fill: rgb(219, 234, 254)),
  "bg-blue-200": (fill: rgb(191, 219, 254)),
  "bg-blue-500": (fill: rgb(59, 130, 246)),
  
  "bg-green-50": (fill: rgb(240, 253, 244)),
  "bg-green-100": (fill: rgb(220, 252, 231)),
  "bg-green-200": (fill: rgb(187, 247, 208)),
  "bg-green-500": (fill: rgb(34, 197, 94)),
  
  "bg-gray-50": (fill: rgb(249, 250, 251)),
  "bg-gray-100": (fill: rgb(243, 244, 246)),
  "bg-gray-200": (fill: rgb(229, 231, 235)),
  "bg-gray-500": (fill: rgb(107, 114, 128)),
  
  "text-red-500": (color: rgb(239, 68, 68)),
  "text-blue-500": (color: rgb(59, 130, 246)),
  "text-green-500": (color: rgb(34, 197, 94)),
  "text-gray-500": (color: rgb(107, 114, 128)),
  "text-white": (color: white),
  "text-black": (color: black),
  
  "bg-yellow-100": (fill: rgb(254, 249, 195)),
  "bg-white": (fill: white)
)

#let css-sizing-classes = (
  "w-full": (width: 100%),
  "w-1/2": (width: 50%),
  "w-1/3": (width: 33.333%),
  "w-2/3": (width: 66.667%),
  "w-1/4": (width: 25%),
  "w-3/4": (width: 75%),
  
  "h-8": (height: 32pt),
  "h-12": (height: 48pt),
  "h-16": (height: 64pt),
  "h-24": (height: 96pt),
  "h-32": (height: 128pt),
  
  "text-xs": (size: 10pt),
  "text-sm": (size: 12pt),
  "text-base": (size: 14pt),
  "text-lg": (size: 18pt),
  "text-xl": (size: 20pt),
  "text-2xl": (size: 24pt),
  "text-3xl": (size: 30pt)
)

#let all-css-classes = css-layout-classes + css-alignment-classes + css-spacing-classes + css-color-classes + css-sizing-classes

#let create-token(type, value, attributes: none) = (
  type: type,
  value: value,
  attributes: attributes
)

#let extract-attributes(tag-content) = {
  let attrs = (:)
  
  let class-match = tag-content.match(regex("class[Name]*=[\"']([^\"']*)[\"']"))
  if class-match != none {
    attrs.insert("class", class-match.captures.at(0))
  }
  
  let id-match = tag-content.match(regex("id=[\"']([^\"']*)[\"']"))
  if id-match != none {
    attrs.insert("id", id-match.captures.at(0))
  }
  
  attrs
}

#let tokenize(html-string) = {
  let tokens = ()
  let tag-regex = regex("<[^>]+>")
  let tag-matches = html-string.matches(tag-regex)
  
  if tag-matches.len() == 0 {
    return (create-token(token-types.text, html-string),)
  }
  
  let current-pos = 0
  
  for tag-match in tag-matches {
    if tag-match.start > current-pos {
      let text-content = html-string.slice(current-pos, tag-match.start)
      if text-content.trim() != "" {
        tokens = tokens + (create-token(token-types.text, text-content),)
      }
    }
    
    let tag-content = tag-match.text
    let is-closing = tag-content.starts-with("</")
    let is-self-closing = tag-content.ends-with("/>")
    
    if is-closing {
      let name-match = tag-content.match(regex("</([a-zA-Z][a-zA-Z0-9]*)"))
      if name-match != none {
        let element-name = name-match.captures.at(0)
        tokens = tokens + (create-token(token-types.close-tag, element-name),)
      }
    } else if is-self-closing {
      let name-match = tag-content.match(regex("<([a-zA-Z][a-zA-Z0-9]*)"))
      if name-match != none {
        let element-name = name-match.captures.at(0)
        let attrs = extract-attributes(tag-content)
        tokens = tokens + (create-token(token-types.self-closing, element-name, attributes: attrs),)
      }
    } else {
      let name-match = tag-content.match(regex("<([a-zA-Z][a-zA-Z0-9]*)"))
      if name-match != none {
        let element-name = name-match.captures.at(0)
        let attrs = extract-attributes(tag-content)
        tokens = tokens + (create-token(token-types.open-tag, element-name, attributes: attrs),)
      }
    }
    
    current-pos = tag-match.end
  }
  
  if current-pos < html-string.len() {
    let remaining-text = html-string.slice(current-pos)
    if remaining-text.trim() != "" {
      tokens = tokens + (create-token(token-types.text, remaining-text),)
    }
  }
  
  tokens
}