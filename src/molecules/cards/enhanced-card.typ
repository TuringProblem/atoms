#import "../../core/component.typ": *
#import "../../colors/colors.typ": *

// Enhanced card component with data streaming support

#let cardVariants = (
  default: (
    fill: whites.standard,
    stroke: 1pt + shades.gray.light,
  ),
  research: (
    fill: shades.blue.lightest,
    stroke: 1pt + blues.standard,
    accent: blues.standard,
  ),
  draft: (
    fill: shades.orange.lightest,
    stroke: 1pt + oranges.light,
    accent: oranges.light,
  ),
  published: (
    fill: shades.green.lightest, 
    stroke: 1pt + greens.standard,
    accent: greens.standard,
  ),
  review: (
    fill: shades.purple.lightest,
    stroke: 1pt + purples.standard,
    accent: purples.standard,
  ),
  ghost: (
    fill: none,
    stroke: 1pt + shades.gray.light,
  )
)

#let cardSizes = (
  sm: (padding: 8pt, text-size: 9pt, title-size: 11pt),
  md: (padding: 12pt, text-size: 10pt, title-size: 12pt),
  lg: (padding: 16pt, text-size: 11pt, title-size: 14pt),
)

// Single card component
#let card(
  content,
  variant: "default",
  size: "md",
  title: none,
  subtitle: none,
  footer: none,
  width: auto,
  config: (:)
) = {
  
  let variantStyle = cardVariants.at(variant)
  let sizeStyle = cardSizes.at(size)
  
  let finalConfig = variantStyle + sizeStyle + config + (width: width)
  
  buildComponent(
    type: "card",
    variant: variant,
    size: size,
    variants: cardVariants,
    sizes: cardSizes,
    config: finalConfig,
  )[
    // Header section
    #if title != none [
      #block(below: sizeStyle.padding * 0.5)[
        #text(
          size: sizeStyle.title-size, 
          weight: "bold",
          fill: variantStyle.at("accent", default: black)
        )[#title]
        
        #if subtitle != none [
          #linebreak()
          #text(size: sizeStyle.text-size * 0.9, style: "italic")[#subtitle]
        ]
      ]
    ]
    
    // Main content
    #content
    
    // Footer section  
    #if footer != none [
      #block(above: sizeStyle.padding * 0.5)[
        #line(length: 100%, stroke: 0.5pt + shades.gray.light)
        #v(sizeStyle.padding * 0.5)
        #text(size: sizeStyle.text-size * 0.8, fill: shades.gray.dark)[#footer]
      ]
    ]
  ]
}

// Data-driven card grid - simple API for multiple cards
#let cardGrid(
  data,
  variant: "default", 
  size: "md",
  columns: 2,
  gap: 12pt,
  config: (:)
) = {
  let items = processData(data, card)
  
  grid(
    columns: columns,
    gutter: gap,
    ..items.map(item => {
      card(
        item.at("content", default: ""),
        variant: item.at("variant", default: variant),
        size: item.at("size", default: size), 
        title: item.at("title", default: none),
        subtitle: item.at("subtitle", default: none),
        footer: item.at("footer", default: none),
        width: 100%,
        config: config
      )
    })
  )
}

// Quick paper card for research
#let paperCard(
  title,
  authors: none,
  abstract: none,
  year: none,
  status: "draft",
  config: (:)
) = {
  let statusVariant = if status == "published" { "published" } 
                      else if status == "review" { "review" }
                      else if status == "draft" { "draft" }
                      else { "default" }
  
  card(
    [#if abstract != none [ #abstract ] else [ No abstract available. ]],
    variant: statusVariant,
    title: title,
    subtitle: if authors != none [ #authors ] else [ none ],
    footer: if year != none [ #year ] else [ none ],
    config: config
  )
}