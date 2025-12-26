#import "../../colors/colors.typ": *
#import "../../util/text-sizes/text-utils.typ": *

#let testCard(mainContent: (:)) = {
  let header = mainContent.header.title
  let size = textSizes.at(mainContent.header.size)
  let cardSize = cardSizes.height.at(mainContent.main.height)
  let cardWidth = cardSizes.width.at(mainContent.main.width)


  set page(fill: mainContent.main.background-color)
  align(alignment.at(mainContent.main.pos))[
      #move(dy: -2.0cm)[
        #box(width: cardWidth, fill: shades.gray.lightest, inset: 6pt, radius: 4pt, stroke: 1pt + shades.gray.border-lightest, height: cardSize)[
          #text(size: size)[ #header ]
        ]
      ]
  ]
}
