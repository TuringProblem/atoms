#let card(
  content,
  config: (:),  
) = {
  let defaults = (
    padding: 12pt,
    radius: 4pt,
    border: (
      width: 1pt,
      color: luma(200),
      style: "solid",
    ),
    background: (
      color: luma(250),
      gradient: none,  
    ),
    shadow: none,  
    header: none,  
  )
  
  let merged = defaults + config
  
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
          #text(weight: "bold", size: 11pt)[
            #if merged.header.icon != none [#merged.header.icon ]
            #merged.header.title
          ]
        ]
      ]
      #content
    ]
  )
}
