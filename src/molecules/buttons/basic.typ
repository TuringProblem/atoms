#import "../../colors/colors.typ": *

#let basicButton(
  content,
  metadata: (dx: 0cm, dy: 0cm),
  link: none,
  variant: "default",  
  size: "md",
  bg-color: auto,
  stroke: auto,
  text-color: auto,
  radius: auto,
  width: auto,
  block: false,        
) = {

  let variants = (
    default: (fill: shades.green.mid, stroke: 1pt + luma(200), text: black),
    primary: (fill: shades.white.mid, stroke: none, text: white),
    secondary: (fill: black, stroke: none, text: whites.standard),
    ghost: (fill: none, stroke: 1pt + luma(200), text: black),
    alert: (fill: reds.alertRed, stroke: none, text: white),
    github: (fill: shades.white.dark, stroke: none, text: whites.standard),
  )
  
  let sizes = (
    sm: (padding: (x: 8pt, y: 4pt), text-size: 8pt, radius: 2pt),
    md: (padding: (x: 12pt, y: 6pt), text-size: 9pt, radius: 3pt),
    lg: (padding: (x: 16pt, y: 8pt), text-size: 10pt, radius: 4pt),
  )
  
  let v = variants.at(variant)
  let s = sizes.at(size)
  
  let final-fill = if bg-color != auto { bg-color } else { v.fill }
  let final-stroke = if stroke != auto { stroke } else { v.stroke }
  let final-text-color = if text-color != auto { text-color } else { v.text }
  let final-radius = if radius != auto { radius } else { s.radius }
  let final-width = if block { 100% } else { width }
  
  place(dy: metadata.dy, dx: metadata.dx)[
  #box(
    fill: final-fill,
    stroke: final-stroke,
    radius: final-radius,
    inset: s.padding,
    width: final-width,
  )[
    #text(
      fill: final-text-color,
      size: s.text-size,
      weight: "medium",
    )[
      #if variant == "github" { link(link)[#image("../../../images/github.png")] } else { content }
    ]
  ]
  ]
}
