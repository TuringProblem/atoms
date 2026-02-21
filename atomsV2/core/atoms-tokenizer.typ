#import "grammar.typ": *

#let tokenize-atoms(atoms-string) = {
  let tokens = ()
  let current-pos = 0
  let length = atoms-string.len()
  
  while current-pos < length {
    let char = atoms-string.at(current-pos)
    
    if char == "<" {
      tokens = tokens + (create-atoms-token(atoms-tokens.open-bracket, "<", start-pos: current-pos, end-pos: current-pos + 1),)
      current-pos += 1
    } else if char == ">" {
      tokens = tokens + (create-atoms-token(atoms-tokens.close-bracket, ">", start-pos: current-pos, end-pos: current-pos + 1),)
      current-pos += 1
    } else if char == "{" {
      tokens = tokens + (create-atoms-token(atoms-tokens.open-brace, "{", start-pos: current-pos, end-pos: current-pos + 1),)
      current-pos += 1
    } else if char == "}" {
      tokens = tokens + (create-atoms-token(atoms-tokens.close-brace, "}", start-pos: current-pos, end-pos: current-pos + 1),)
      current-pos += 1
    } else if char == "'" {
      // Parse quoted class string
      let quote-start = current-pos
      current-pos += 1
      let class-content = ""
      
      while current-pos < length and atoms-string.at(current-pos) != "'" {
        class-content += atoms-string.at(current-pos)
        current-pos += 1
      }
      
      if current-pos < length {
        current-pos += 1 // Skip closing quote
      }
      
      tokens = tokens + (create-atoms-token(atoms-tokens.classes, class-content, start-pos: quote-start, end-pos: current-pos),)
      
    } else if atoms-string.slice(current-pos, calc.min(current-pos + 2, length)) == "->" {
      tokens = tokens + (create-atoms-token(atoms-tokens.arrow, "->", start-pos: current-pos, end-pos: current-pos + 2),)
      current-pos += 2
    } else if char == " " or char == "\n" or char == "\t" {
      // Collect whitespace as content token
      let start = current-pos
      let whitespace = ""
      
      while current-pos < length {
        let c = atoms-string.at(current-pos)
        if c == " " or c == "\n" or c == "\t" {
          whitespace += c
          current-pos += 1
        } else {
          break
        }
      }
      
      if whitespace.len() > 0 {
        tokens = tokens + (create-atoms-token(atoms-tokens.content, whitespace, start-pos: start, end-pos: current-pos),)
      }
    } else {
      // Parse tag name or content
      let start = current-pos
      let content = ""
      
      // Read until next special character
      while current-pos < length {
        let c = atoms-string.at(current-pos)
        if c in ("<", ">", "'", "{", "}", " ", "\n", "\t") {
          break
        }
        if atoms-string.slice(current-pos, calc.min(current-pos + 2, length)) == "->" {
          break  
        }
        content += c
        current-pos += 1
      }
      
      if content.len() > 0 {
        // Check if it's a known tag
        if content in atoms-tags {
          tokens = tokens + (create-atoms-token(atoms-tokens.tag, content, start-pos: start, end-pos: current-pos),)
        } else {
          tokens = tokens + (create-atoms-token(atoms-tokens.content, content, start-pos: start, end-pos: current-pos),)
        }
      }
    }
  }
  
  tokens
}

#let parse-atoms-classes(class-string) = {
  if class-string == none or class-string.trim() == "" {
    return ()
  }
  
  let abbreviations = class-string.split(" ")
  let full-classes = ()
  
  for abbrev in abbreviations {
    if abbrev in class-abbreviations {
      full-classes = full-classes + (class-abbreviations.at(abbrev),)
    } else {
      // Keep unknown classes as-is (might be custom)
      full-classes = full-classes + (abbrev,)
    }
  }
  
  full-classes.join(" ")
}