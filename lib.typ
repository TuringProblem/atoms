#import "src/molecules/buttons/basic.typ": * 

#import "src/molecules/buttons/example.typ": * 


#card(config: (
  padding: 16pt,
  radius: 8pt,
  border: (width: 0.5pt, color: rgb(0, 0, 0)),
  header: (title: "Example Header :p", icon: emoji.gear),
))[
  #align(center)[
    #text()[Hello, world!] \ 
    #basicButton([#link("https://github.com/TuringProblem")[Hello world!]], variant: "secondary", size: "lg")
  ]
]
