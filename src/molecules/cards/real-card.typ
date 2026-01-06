#import "../../colors/colors.typ": *
#import "../../util/text-sizes/text-utils.typ": *
#import "variants/variants.typ": *
#import "../../util/ternary/ternary.typ": *


/**
 * @author: { @Override }
 * @since : 20251226 @ 10:56
**/



// there should be a better way of checking the variant instead of using a ternary over and over and over

// wish there was pattern matching :/

#let testCard(cardMetaData: (containerCoordinates: (dx: 0cm, dy: 0cm), containerWidth: none, containerHeight: none, background: none), variant: "full", mainContent: (:), data: none) = {

  let combinedContent = variants + mainContent

  let header = ternary(variant == "full", variants.full.header.title, "")
  let size = textSizes.at(ternary(variant == "full", variants.full.header.size, "sm"))
  // need to check if there is no data from user
  let mainHeight = combinedContent.inside.main.at("height")
  let cardSize = cardSizes.height.at(ternary(variant == "full", variants.full.main.height, mainHeight))
  // need to check if there is no data from user
  let mainWidth = combinedContent.inside.main.at("width")
  let cardWidth = cardSizes.width.at(ternary(variant == "full", variants.full.main.width, mainWidth))
  let color = cardMetaData.background



  let vals = variants.at(variant)
  let values = vals.values()
  let keys = vals.keys()

 



// I want to normalize Combined and only get the needed content

  // let finalHeader = com

  if variant == "full" {
    set page(fill: combinedContent.full.main.background-color)

    let finalContent = combinedContent.at("content")
    let finalHeader = combinedContent.at("header")

    align(alignment.at(variants.full.main.pos))[
      #move(dy: variants.full.main.dy)[
        #box(width: cardWidth, fill: cards.full.card-background, inset: 6pt, radius: 4pt, stroke: 1pt + cards.full.card-border, height: cardSize)[
          #if finalHeader.title != none { text(size: size)[ #combinedContent.header.title ] }\

          #align(alignment.at(combinedContent.content.pos))[
            #finalContent.at("content")
          ]
        ]
      ]
    ]
  } else if variant == "inside" {
    align(alignment.at(variants.inside.main.pos))[
      #place(dy: cardMetaData.containerCoordinates.dy, dx: cardMetaData.containerCoordinates.dx)[
        #box(width: cardMetaData.containerWidth, fill: color, inset: 6pt, radius: 4pt, stroke: 1pt + cards.full.card-border, height: cardMetaData.containerHeight)[
          #v(0.3cm)
          #data
        ]
      ]
    ]
  }
}

