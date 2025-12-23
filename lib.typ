#import "src/molecules/buttons/basic.typ": * 

#import "src/molecules/buttons/example.typ": * 


#let mainConfig = (
  header: (title: "Java", icon: emoji.football),
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
