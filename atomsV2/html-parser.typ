#let css-classes = (
  "p-1": (padding: 4pt),
  "p-2": (padding: 8pt), 
  "p-3": (padding: 12pt),
  "p-4": (padding: 16pt),
  "p-5": (padding: 20pt),
  "p-6": (padding: 24pt),
  
  "m-1": (margin: 4pt),
  "m-2": (margin: 8pt),
  "m-3": (margin: 12pt),
  "m-4": (margin: 16pt),
  
  "bg-red-100": (fill: rgb(254, 226, 226)),
  "bg-blue-100": (fill: rgb(219, 234, 254)),
  "bg-green-100": (fill: rgb(220, 252, 231)),
  "bg-gray-100": (fill: rgb(243, 244, 246)),
  
  "text-sm": (size: 12pt),
  "text-base": (size: 14pt),
  "text-lg": (size: 18pt),
  "text-xl": (size: 20pt),
)

#let parse-classes(class-string) = {
  if class-string == none { return (:) }
  
  let classes = class-string.split(" ")
  let styles = (:)
  
  for class in classes {
    if class in css-classes {
      let class-style = css-classes.at(class)
      for (key, value) in class-style {
        styles.insert(key, value)
      }
    }
  }
  
  styles
}

#let html(content) = {
  let html-string = content
  
  // Simple approach: find divs with classes and convert them
  let div-regex = regex("<div[^>]*class=[\"']([^\"']*)[\"'][^>]*>(.*?)</div>")
  let div-matches = html-string.matches(div-regex)
  
  if div-matches.len() == 0 {
    return [#html-string]
  }
  
  let result = ()
  let last-end = 0
  
  for div-match in div-matches {
    // Add text before this div
    if div-match.start > last-end {
      let before-text = html-string.slice(last-end, div-match.start)
      if before-text.trim() != "" {
        result = result + ([#before-text],)
      }
    }
    
    // Parse the div
    let class-attr = div-match.captures.at(0)
    let inner-content = div-match.captures.at(1)
    let styles = parse-classes(class-attr)
    
    // Create block with styles
    if "fill" in styles {
      result = result + (block(
        fill: styles.at("fill"),
        inset: styles.at("padding", default: 0pt),
        [#inner-content]
      ),)
    } else {
      result = result + (block(
        inset: styles.at("padding", default: 0pt),
        [#inner-content]
      ),)
    }
    
    last-end = div-match.end
  }
  
  // Add remaining text
  if last-end < html-string.len() {
    let remaining = html-string.slice(last-end)
    if remaining.trim() != "" {
      result = result + ([#remaining],)
    }
  }
  
  result.join()
}