#import "../../core/component.typ": *
#import "../../colors/colors.typ": *

// UML Diagram Components for CS Notes

#let umlClass(
  name,
  attributes: (),
  methods: (),
  stereotype: none,
  size: "md"
) = {
  buildComponent(
    type: "uml-class",
    variant: "default", 
    size: size,
    config: (
      fill: whites.standard,
      stroke: 1pt + shades.gray.dark,
      padding: 0pt,
      width: auto
    )
  )[
    #block(width: 100%)[
      #if stereotype != none [
        #align(center)[
          #linebreak()
          #text(size: 8pt, style: "italic")[«#stereotype»]
        ]
        #line(length: 100%, stroke: 0.5pt + shades.gray.light)
      ]
      
      // Class name
      #if name != "" [
        #align(center)[
            #linebreak()
            #text(weight: "bold", size: 11pt)[#name]
        ]
        #line(length: 100%, stroke: 0.5pt + shades.gray.light)
      ]
      
      // Attributes section
      #if attributes.len() > 0 [
        #pad(x: 6pt, y: 4pt)[
          #for attr in attributes [
            #text(size: 9pt, font: "Courier New")[#attr]
            #linebreak()
          ]
        ]
      ]
      // Methods section  
      #if methods.len() > 0 [
        #line(length: 100%, stroke: 0.5pt + shades.gray.light)
        #pad(x: 6pt, y: 4pt)[
          #for method in methods [
            #text(size: 9pt, font: "Courier New")[#method]
            #linebreak()
          ]
        ]
      ]
    ]
  ]
}

// UML Relationship Arrow
#let umlRelation(
  from: "A",
  to: "B", 
  type: "association",
  label: none,
  horizontal: true
) = {
  let arrow = if type == "inheritance" { "▷" }
             else if type == "composition" { "♦" }
             else if type == "aggregation" { "◇" }
             else if type == "dependency" { "→" }
             else { "—" }
  
  if horizontal [
    #grid(
      columns: (1fr, auto, 1fr),
      gutter: 4pt,
      align(center)[#from],
      align(center)[
        #text(size: 10pt)[#arrow]
        #if label != none [
          #linebreak()
          #text(size: 7pt, style: "italic")[#label]
        ]
      ],
      align(center)[#to]
    )
  ] else [
    #align(center)[
      #from
      #v(4pt)
      #text(size: 10pt)[#arrow]
      #if label != none [
        #text(size: 7pt, style: "italic")[#label]
      ]
      #v(4pt)
      #to
    ]
  ]
}

// State Machine Diagram
#let stateDiagram(
  states: (),
  transitions: (),
  title: "State Machine"
) = {
  buildComponent(
    type: "state-diagram",
    variant: "default",
    size: "lg",
    config: (width: auto, padding: 12pt)
  )[
    #align(center)[
      #text(weight: "bold", size: 12pt)[#title]
      #v(8pt)
      
      // States as circles
      #grid(
        columns: calc.min(3, states.len()),
        gutter: 20pt,
        ..states.map(state => 
          circle(
            radius: 20pt,
            fill: if state.at("initial", default: false) { greens.standard } 
                  else if state.at("final", default: false) { reds.standard }
                  else { blues.standard },
            stroke: 2pt + whites.standard
          )[
            #align(center)[
              #text(
                fill: whites.standard,
                size: 9pt,
                weight: "bold"
              )[#state.name]
            ]
          ]
        )
      )
      
      #v(8pt)
      
      // Transitions
      #if transitions.len() > 0 [
        #text(weight: "bold", size: 9pt)[Transitions:]
        #for trans in transitions [
          #text(size: 8pt)[
            #trans.from → #trans.to
            #if trans.at("condition", default: none) != none [
              [#trans.condition]
            ]
          ]
          #linebreak()
        ]
      ]
    ]
  ]
}

// Sequence Diagram (simplified)
#let sequenceDiagram(
  actors: (),
  messages: (),
  title: "Sequence Diagram"
) = {
  buildComponent(
    type: "sequence-diagram",
    variant: "default",
    size: "lg", 
    config: (width: 100%, padding: 12pt)
  )[
    #align(center)[
      #text(weight: "bold", size: 12pt)[#title]
      #v(8pt)
    ]
    
    // Actors header
    #grid(
      columns: actors.len(),
      gutter: 20pt,
      ..actors.map(actor =>
        align(center)[
          #rect(
            fill: shades.blue.lighter,
            stroke: 1pt + blues.standard,
            inset: 6pt,
            radius: 2pt
          )[
            #text(weight: "bold", size: 9pt)[#actor]
          ]
        ]
      )
    )
    
    #v(8pt)
    
    // Messages
    #for message in messages [
      #grid(
        columns: (1fr, 2fr, 1fr),
        gutter: 8pt,
        align(right)[#text(size: 8pt)[#message.from]],
        align(center)[
          #text(size: 8pt)[→ #message.text →]
        ],
        align(left)[#text(size: 8pt)[#message.to]]
      )
      #v(4pt)
    ]
  ]
}

// Quick UML use case
#let useCase(
  name,
  actors: (),
  description: none
) = {
  buildComponent(
    type: "use-case",
    variant: "default",
    size: "md",
    config: (width: 150pt, padding: 8pt)
  )[
    #align(center)[
      // Use case (oval)
      #ellipse(
        width: 100pt,
        height: 40pt,
        fill: shades.yellow.lighter,
        stroke: 1pt + oranges.light
      )[
        #align(center + horizon)[
          #text(size: 9pt, weight: "bold")[#name]
        ]
      ]
      
      #v(6pt)
      
      // Actors
      #if actors.len() > 0 [
        #text(size: 8pt, weight: "bold")[Actors: ]
        #text(size: 8pt)[#for (i, actor) in actors.enumerate() [ #if i > 0 [, ] #actor ]]
        #v(4pt)
      ]
      
      // Description
      #if description != none [
        #text(size: 7pt, style: "italic")[#description]
      ]
    ]
  ]
}