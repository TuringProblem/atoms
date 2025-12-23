#import "src/molecules/buttons/basic.typ": * 

#import "src/molecules/buttons/example.typ": * 


#card(config: (
  padding: 16pt,
  radius: 8pt,
  border: (width: 2pt, color: blue),
  header: (title: "Example Header :p", icon: emoji.gear),
))[
  #align(center)[
    #text()[Hello, world!] \ 
    #basicButton("Hello world!", variant: "destructive", size: "lg")
  ]
]
