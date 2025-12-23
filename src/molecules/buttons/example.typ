#import "../../colors/colors.typ": *

#let card(
  content,
  config: (:),  
) = {

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
      padding: 12pt,
      radius: 4pt,
      border: (
        width: 0.5pt,
        color: black,
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
  let specialValues = values.filter(x => x == values.at(0)).map(x => x + " Zaddy")

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
