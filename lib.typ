#import "src/molecules/buttons/basic.typ": * 
#import "src/molecules/cards/card.typ": *


#let mainConfig = (
  header: (title: "Java", icon: emoji.football),
  // TODO: Fix the padding, and radius, and couple them with a variant: str (dictionary.key())
  padding: 16pt,
  radius: 8pt,
  border: (width: 0.5pt, color: none, style: "solid"),
)



#let header = (icon: emoji.money, content: "Hello, World", size: "3xl")
#let pos = (card-pos: "center", text-pos: "center", header-pos: "center")
#let secondPos = (card-pos: "center", text-pos: "center", header-pos: "center")


#let cont = [
#card(header: none, [

Check out my github :)
#align(center)[
  #basicButton([#link("https://github.com/TuringProblem")[Click]], variant: "alert", size: "lg")
]

], width: 50%, positions: secondPos)


shit
what is 

]

#card(header: header, cont, width: 80%, positions: pos)












