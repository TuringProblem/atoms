#import "../../colors/colors.typ": *

/**
 * IDEA:
 * 
 * 
 (Variants: 
  > main - Classic, looks popping 

 )
 *
 *
 *
 *
 *
 *
**/

#let composeVariantsWithSizes(variants, sizes) = {
  let v = variants.at(variant)
  let s = sizes.at(size)
  let values = ()

  let combined = v.keys().map(x => {
    let value = v.at(x)
    let size = s.at(x)
    values.push((x, value, size))
  })
}


#let card(content, vriant: "default", config: (:),) = {
  //TODO: figure out how to add variants into this FUNCTIONALLY 
  let variants = (
    default: (border: (width: none, color: none, style: none), background: (color: shades.white.lighter, gradient: none)),
    primary: (border: (width: none, color: none, style: none), background: (color: shades.green.lighter, gradient: none)),
    secondary: (border: (width: none, color: none, style: none), background: (color: shades.green.darker, gradient: none)),
    ghost: (border: (width: none, color: none, style: none), background: (color: none, gradient: none)),
  )

  let sizes = (
    sm: (padding: (x: 8pt, y: 4pt), text-size: 8pt, radius: 2pt),
    md: (padding: (x: 12pt, y: 6pt), text-size: 9pt, radius: 3pt),
    lg: (padding: (x: 16pt, y: 8pt), text-size: 10pt, radius: 4pt),
  )



  let defaults = (
      header: none,  
      size: "md",
      padding: 12pt,
      radius: 4pt,
      border: (
        width: 0.5pt,
        color: none,
        style: "solid",
      ),
      background: (
        color: shades.white.lighter,
        gradient: none,  
      ),
      shadow: none,  
    )

  let merged = defaults + config
  let values = merged.keys()
  let parseFunction(value) = {
    if value == "header" {
      return variants.keys()
    }
  }

  let specialValues = values.filter(x => x == values.at(0)).map(x => parseFunction(x))

  let apply-shadow(body) = {
    if merged.shadow != none {
      let s = merged.shadow
      block(
        place(dx: s.offset.x, dy: s.offset.y)[
          #box(fill: s.color, radius: merged.radius, inset: merged.padding)[
            #body
          ]
        ]
      )
      body
    } else {
      body
    }
  }
  
  apply-shadow(
    block(
      fill: merged.background.color,
      stroke: merged.border.width + merged.border.color,
      radius: merged.radius,
      inset: merged.padding,
      width: 100%,
    )[
      #if merged.header != none [
        #block(below: 8pt)[
          #text(weight: "bold", size: 12pt)[
            #if merged.header.icon != none [#merged.header.icon ]
            #merged.header.title
          ]
        ]
      ]
      #content\

      #align(center)[
      #specialValues
      ]
    ]
  )
}

