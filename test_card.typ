#import "src/molecules/cards/real-card.typ": *

/**
 *
 * Definition:
 * > content: (size: {sm, md, lg, xl, 2xl, 3xl}, width: 100%, height: 100%, )
 * > 
 *
 */
// zIndex: none,


#let contentBody = [
hello
  #align(center)[

  ```js
  console.log()
  ```
  ]


  #testCard(cardPosition: 2cm, variant: "inside")
]

#let cardContentExample = (
  container: (),
  header: (title: "hello, world", size: "2xl"),
  content: (pos: "left", content: contentBody),
)

#testCard(variant: "full", mainContent: cardContentExample)
shit

