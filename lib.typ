#import "src/molecules/buttons/basic.typ": * 
#import "src/molecules/cards/example.typ": *


#let mainConfig = (
  header: (title: "Java", icon: emoji.football),
  // TODO: Fix the padding, and radius, and couple them with a variant: str (dictionary.key())
  padding: 16pt,
  radius: 8pt,
  border: (width: 0.5pt, color: none, style: "solid"),
)


#card(config: mainConfig)[
  #align(center)[
    #text()[Hello, world!] \ 
    #basicButton([#link("https://github.com/TuringProblem")[Hello world!]], variant: "secondary", size: "lg")
  ]
]


#align(center)[
  #basicButton([#link("https://github.com/TuringProblem")[Github]], variant: "alert", size: "lg")
]
