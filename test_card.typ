#import "src/molecules/cards/real-card.typ": *

/**
 *
 * Definition:
 * > content: (size: {sm, md, lg, xl, 2xl, 3xl}, width: 100%, height: 100%, )
 * > 
 *
 */




#let mainContent = (
  main: (pos: "center", width: "xl", height: "3xl", background-color: rgb(225, 225, 225)),
  header: (title: "hello, world", size: "2xl"),
)


#testCard(mainContent: mainContent)





