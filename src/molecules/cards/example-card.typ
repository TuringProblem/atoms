#import "../../colors/colors.typ": *

#let card(
  variant: "default", 
  size: "md",
  position: "left",
  ..content
) = {
  let variants = (
    default: (border: none, background: (color: shades.white.light, gradient: none), shadow: (offset: (x: 0pt, y: 2pt), blur: 8pt, color: rgb(0, 0, 0, 10%))),
    primary: (border: (width: 0.5pt, color: shades.green.lighter, style: "solid"), background: (color: shades.green.lighter, gradient: none), shadow: none),
    secondary: (border: (width: 0.5pt, color: shades.green.darker, style: "solid"), background: (color: shades.green.darker, gradient: none), shadow: none),
    ghost: (border: none, background: (color: none, gradient: none), shadow: none),
  )

  let sizes = (
    sm: (padding: (x: 8pt, y: 6pt), text-size: 9pt, radius: 2pt, spacing: 4pt),
    md: (padding: (x: 12pt, y: 8pt), text-size: 10pt, radius: 4pt, spacing: 6pt),
    lg: (padding: (x: 16pt, y: 10pt), text-size: 11pt, radius: 6pt, spacing: 8pt),
    xl: (padding: (x: 20pt, y: 12pt), text-size: 12pt, radius: 8pt, spacing: 10pt),
    "2xl": (padding: (x: 24pt, y: 14pt), text-size: 13pt, radius: 10pt, spacing: 12pt),
    "3xl": (padding: (x: 28pt, y: 16pt), text-size: 14pt, radius: 12pt, spacing: 14pt),
  )

  let variant-config = variants.at(variant)
  let size-config = sizes.at(size)

  let sections = (:)
  
  for (key, value) in content.named().pairs() {
    sections.insert(key, value)
  }
  
  let pos-args = content.pos()
  if pos-args.len() > 0 {
    if pos-args.len() == 1 {
      sections.insert("body", pos-args.at(0))
    } else {
      sections.insert("body", pos-args.join())
    }
  }

  let card-content = block(
    fill: variant-config.background.color,
    stroke: if variant-config.border != none and variant-config.border.width != none {
      variant-config.border.width + variant-config.border.color
    } else {
      none
    },
    radius: size-config.radius,
    inset: (
      x: size-config.padding.x,
      y: size-config.padding.y
    ),
    width: 100%,
  )[
    #let content-blocks = ()
    
    #if "header" in sections {
      content-blocks.push([
        #block(below: size-config.spacing)[
          #text(weight: "bold", size: size-config.text-size + 2pt)[
            #sections.header
          ]
        ]
      ])
    }
    
    #if "body" in sections {
      content-blocks.push([
        #block(below: if "footer" in sections { size-config.spacing } else { 0pt })[
          #text(size: size-config.text-size)[
            #sections.body
          ]
        ]
      ])
    }
    
    #if "footer" in sections {
      content-blocks.push([
        #block(above: size-config.spacing, below: 0pt)[
          #text(size: size-config.text-size - 1pt, fill: shades.gray.base)[
            #sections.footer
          ]
        ]
      ])
    }
    
    #for (key, value) in sections {
      if key not in ("header", "body", "footer") {
        content-blocks.push([
          #block(below: size-config.spacing)[
            #text(size: size-config.text-size)[
              #value
            ]
          ]
        ])
      }
    }
    
    #content-blocks.join()
  ]
  
  if position == "center" {
    align(center, card-content)
  } else if position == "right" {
    align(right, card-content)
  } else {
    card-content
  }
}
