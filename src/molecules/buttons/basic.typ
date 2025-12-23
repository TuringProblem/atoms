#let basicButton(
  content,
  variant: "default",  
  size: "md",
  fill: auto,
  stroke: auto,
  text-color: auto,
  radius: auto,
  width: auto,
  block: false,        
) = {

  let variants = (
    default: (fill: luma(240), stroke: 1pt + luma(200), text: black),
    primary: (fill: rgb("#2563eb"), stroke: none, text: white),
    secondary: (fill: rgb("#64748b"), stroke: none, text: white),
    ghost: (fill: none, stroke: 1pt + luma(200), text: black),
    destructive: (fill: rgb("#dc2626"), stroke: none, text: white),
  )
  
  let sizes = (
    sm: (padding: (x: 8pt, y: 4pt), text-size: 8pt, radius: 2pt),
    md: (padding: (x: 12pt, y: 6pt), text-size: 9pt, radius: 3pt),
    lg: (padding: (x: 16pt, y: 8pt), text-size: 10pt, radius: 4pt),
  )
  
  let v = variants.at(variant)
  let s = sizes.at(size)
  
  let final-fill = if fill != auto { fill } else { v.fill }
  let final-stroke = if stroke != auto { stroke } else { v.stroke }
  let final-text-color = if text-color != auto { text-color } else { v.text }
  let final-radius = if radius != auto { radius } else { s.radius }
  let final-width = if block { 100% } else { width }
  
  box(
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
    )[#content]
  ]
}
