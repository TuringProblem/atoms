#import "src/molecules/cards/real-card.typ": *
#import "src/molecules/buttons/basic.typ": *


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
  console.log("hello world");
  const add = a => b => a + b;
  ```
  ]

  #testCard(cardMetaData: (containerCoordinates: (dx: 8.5cm, dy: 0cm), containerWidth: 300pt, containerHeight: 300pt, background: shades.gray.light), variant: "inside", data: [
  Hey, I'm the creator of this 

    #basicButton([#link("https://github.com/TuringProblem")[#image("images/github.png", width: 0.5cm)]], metadata: (dy: -0.8cm, dx: 4.5cm), variant: "alert", size: "sm")\
    #align(left)[
      hello
    ]

  ])\


  and that is something that you needed for that\
  I know that you wanted to talke about this...


]

#let cardContentExample = (
  container: (),
  header: (title: "Example, world", size: "2xl"),
  content: (pos: "left", content: contentBody),
)

#testCard(variant: "full", mainContent: cardContentExample)
