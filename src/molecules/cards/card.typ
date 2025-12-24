#import "../../colors/colors.typ": *
#import "../../util/text-sizes/text-utils.typ": *

#let card(header: (:), content, variant: "standard", width: 100%, positions: (:)) = {

  let variants = (
    standard: (),
  )

align(alignment.at(positions.card-pos))[
    #box(width: width, fill: shades.gray.lightest, inset: 6pt, radius: 4pt, stroke: 1pt + shades.gray.border-lightest)[
    #if header != none [
        #align(alignment.at(positions.header-pos))[
          #box(inset: 8pt)[
            #if header.content != none [ #text(size: textSizes.at(header.size), weight: "bold")[ #header.content ] ]
            #if header.icon != none [ #header.icon ]
          ]
        ]
      ]
      #align(alignment.at(positions.text-pos))[
        #content
      ]
    ]
  ]
}
