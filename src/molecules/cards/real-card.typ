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

#let testCard(cardPosition: 0cm, variant: "full", mainContent: (:)) = {
  let header = ternary(variant == "full", variants.full.header.title, "")
  let size = textSizes.at(ternary(variant == "full", variants.full.header.size, "sm"))
  let cardSize = cardSizes.height.at(ternary(variant == "full", variants.full.main.height, "xl"))
  let cardWidth = cardSizes.width.at(ternary(variant == "full", variants.full.main.width, "xl"))


  let combinedContent = variants + mainContent

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
  } else {
    align(alignment.at(variants.inside.main.pos))[
      #place(dy: cardPosition)[
        #box(width: cardWidth, fill: cards.full.card-background, inset: 6pt, radius: 4pt, stroke: 1pt + cards.full.card-border, height: cardSize)[
          #emoji.fire 
          I'm dumbb
          #text(size: size)[ #header ]\
        ]
      ]
    ]
  }
}

