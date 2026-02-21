#import "../../core/component.typ": *
#import "../../colors/colors.typ": *

// Sectioned Card System for CS Notes

// Main sectioned card component
#let sectionedCard(
  sections,
  variant: "default",
  size: "md",
  width: auto,
  config: (:)
) = {
  let variants = (
    default: (fill: whites.standard, stroke: 1pt + shades.gray.light),
    algorithm: (fill: shades.blue.lightest, stroke: 1pt + blues.standard, accent: blues.standard),
    datastructure: (fill: shades.green.lightest, stroke: 1pt + greens.standard, accent: greens.standard),
    concept: (fill: shades.purple.lightest, stroke: 1pt + purples.standard, accent: purples.standard),
    code: (fill: shades.gray.lightest, stroke: 1pt + shades.gray.dark, accent: shades.gray.dark),
    warning: (fill: shades.orange.lightest, stroke: 1pt + oranges.light, accent: oranges.light)
  )
  
  let variantStyle = variants.at(variant)
  let finalConfig = variantStyle + config + (width: width)
  
  buildComponent(
    type: "sectioned-card",
    variant: variant,
    size: size,
    config: finalConfig
  )[
    // Header Section
    #if sections.at("header", default: none) != none [
      #let header = sections.header
      #block(
        fill: variantStyle.at("accent", default: shades.gray.light),
        width: 100%,
        inset: 8pt,
        radius: (top: 4pt)
      )[
        #text(fill: whites.standard, weight: "bold", size: 12pt)[
          #header.at("title", default: "")
        ]
        #if header.at("subtitle", default: none) != none [
          #h(1fr)
          #text(fill: whites.standard, size: 9pt, style: "italic")[
            #header.subtitle
          ]
        ]
        #if header.at("complexity", default: none) != none [
          #linebreak()
          #text(fill: whites.standard, size: 8pt)[
            Complexity: #header.complexity
          ]
        ]
      ]
    ]
    
    // Main Section
    #if sections.at("main", default: none) != none [
      #let main = sections.main
      #block(
        width: 100%,
        inset: 12pt
      )[
        #if main.at("description", default: none) != none [
          #text(main.description)
          #v(6pt)
        ]
        
        #if main.at("code", default: none) != none [
          #rect(
            fill: shades.gray.lightest,
            stroke: 0.5pt + shades.gray.light,
            inset: 8pt,
            radius: 2pt,
            width: 100%
          )[
            #text(font: "Courier New", size: 9pt)[
              #main.code
            ]
          ]
          #v(6pt)
        ]
        
        #if main.at("visualization", default: none) != none [
          #align(center)[#main.visualization]
          #v(6pt)
        ]
        
        #if main.at("example", default: none) != none [
          #text(weight: "bold", size: 9pt)[Example: ]
          #text(size: 9pt)[#main.example]
          #v(6pt)
        ]
      ]
    ]
    
    // Footer Section
    #if sections.at("footer", default: none) != none [
      #let footer = sections.footer
      #block(
        fill: shades.gray.lightest,
        width: 100%,
        inset: 6pt,
        radius: (bottom: 4pt)
      )[
        #if footer.at("notes", default: none) != none [
          #text(size: 8pt, style: "italic", fill: shades.gray.dark)[
            Notes: #footer.notes
          ]
        ]
        #if footer.at("time-space", default: none) != none [
          #h(1fr)
          #text(size: 8pt, weight: "bold")[
            #footer.time-space
          ]
        ]
      ]
    ]
  ]
}

// Algorithm card shorthand
#let algorithmCard(
  name,
  complexity: none,
  description: none,
  pseudocode: none,
  example: none,
  notes: none,
  config: (:)
) = {
  sectionedCard(
    (
      header: (
        title: name,
        complexity: complexity
      ),
      main: (
        description: description,
        code: if pseudocode != none { raw(pseudocode, lang: "pseudo") } else { none },
        example: example
      ),
      footer: (
        notes: notes
      )
    ),
    variant: "algorithm",
    config: config
  )
}

// Data structure card shorthand
#let dataStructureCard(
  name,
  operations: none,
  description: none,
  visualization: none,
  complexity: none,
  notes: none,
  config: (:)
) = {
  sectionedCard(
    (
      header: (
        title: name,
        subtitle: complexity
      ),
      main: (
        description: description,
        visualization: visualization,
        example: operations
      ),
      footer: (
        notes: notes
      )
    ),
    variant: "datastructure",
    config: config
  )
}

// Concept card shorthand  
#let conceptCard(
  concept,
  definition: none,
  example: none,
  applications: none,
  config: (:)
) = {
  sectionedCard(
    (
      header: (
        title: concept
      ),
      main: (
        description: definition,
        example: example
      ),
      footer: (
        notes: applications
      )
    ),
    variant: "concept",
    config: config
  )
}

// Code snippet card
#let codeCard(
  title,
  code,
  language: "python",
  explanation: none,
  output: none,
  config: (:)
) = {
  sectionedCard(
    (
      header: (
        title: title,
        subtitle: upper(language)
      ),
      main: (
        code: raw(code, lang: language),
        description: explanation,
        example: if output != none { "Output: " + output } else { none }
      )
    ),
    variant: "code",
    config: config
  )
}