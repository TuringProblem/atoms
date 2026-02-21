#import "../../core/component.typ": *
#import "../../colors/colors.typ": *

// Computer Science Data Structure Components

// Stack visualization
#let stack(
  items: (),
  title: "Stack",
  highlight-top: true,
  max-visible: 6,
  size: "md"
) = {
  let visibleItems = items.slice(calc.max(0, items.len() - max-visible))
  
  buildComponent(
    type: "stack",
    variant: "default",
    size: size,
    config: (width: 120pt, padding: 8pt)
  )[
    #align(center)[
      #text(weight: "bold", size: 11pt)[#title]
      #v(4pt)
      
      // Stack pointer
      #if items.len() > 0 [
        #align(left)[#text(size: 8pt)[← TOP]]
      ]
      
      // Stack items (top to bottom)
      #for (i, item) in visibleItems.enumerate().rev() [
        #let isTop = i == visibleItems.len() - 1
        #rect(
          width: 100pt,
          height: 20pt,
          fill: if highlight-top and isTop { blues.standard } else { whites.standard },
          stroke: 1pt + shades.gray.dark,
          inset: 4pt
        )[
          #align(center)[
            #text(
              fill: if highlight-top and isTop { whites.standard } else { black },
              weight: if isTop { "bold" } else { "regular" }
            )[#item]
          ]
        ]
        #v(-1pt)
      ]
      
      // Base
      #rect(width: 100pt, height: 4pt, fill: shades.gray.dark)
      
      #v(4pt)
      #text(size: 8pt, style: "italic")[Size: #items.len()]
    ]
  ]
}

// Queue visualization  
#let queue(
  items: (),
  title: "Queue",
  max-visible: 5,
  size: "md"
) = {
  buildComponent(
    type: "queue", 
    variant: "default",
    size: size,
    config: (width: auto, padding: 8pt)
  )[
    #align(center)[
      #text(weight: "bold", size: 11pt)[#title]
      #v(6pt)
      
      #grid(
        columns: (30pt,) + (50pt,) * calc.min(items.len(), max-visible) + (30pt,),
        gutter: 2pt,
        
        // FRONT pointer
        align(center)[
          #text(size: 8pt, weight: "bold")[FRONT]
          #v(2pt)
          #if items.len() > 0 [↓]
        ],
        
        // Queue items
        ..items.slice(0, calc.min(items.len(), max-visible)).map(item => 
          rect(
            width: 50pt,
            height: 25pt, 
            fill: whites.standard,
            stroke: 1pt + shades.gray.dark,
            inset: 4pt
          )[#align(center)[#item]]
        ),
        
        // REAR pointer
        align(center)[
          #text(size: 8pt, weight: "bold")[REAR]
          #v(2pt)
          #if items.len() > 0 [↓]
        ]
      )
      
      #v(6pt)
      #text(size: 8pt, style: "italic")[Length: #items.len()]
    ]
  ]
}

// Linked List visualization
#let linkedList(
  items: (),
  title: "Linked List",
  show-pointers: true,
  size: "md"
) = {
  buildComponent(
    type: "linkedlist",
    variant: "default", 
    size: size,
    config: (width: auto, padding: 8pt)
  )[
    #align(center)[
      #text(weight: "bold", size: 11pt)[#title]
      #v(6pt)
      
      // HEAD pointer
      #if items.len() > 0 [
        #text(size: 8pt, weight: "bold")[HEAD]
        #v(2pt)
      ]
      
      // Nodes
      #for (i, item) in items.enumerate() [
        #grid(
          columns: (40pt, 20pt),
          gutter: 0pt,
          
          // Data box
          rect(
            width: 40pt,
            height: 25pt,
            fill: whites.standard,
            stroke: 1pt + shades.gray.dark,
            inset: 4pt
          )[#align(center)[#item]],
          
          // Pointer box
          rect(
            width: 20pt, 
            height: 25pt,
            fill: shades.gray.lighter,
            stroke: 1pt + shades.gray.dark,
            inset: 4pt
          )[
            #align(center)[
              #if i < items.len() - 1 [→] else [∅]
            ]
          ]
        )
        
        #if i < items.len() - 1 [
          #h(4pt)
        ]
      ]
    ]
  ]
}

// Binary Tree visualization (simple)
#let binaryTree(
  root: none,
  left: none, 
  right: none,
  title: "Binary Tree",
  size: "lg"
) = {
  buildComponent(
    type: "tree",
    variant: "default",
    size: size, 
    config: (width: 150pt, padding: 12pt)
  )[
    #align(center)[
      #text(weight: "bold", size: 11pt)[#title]
      #v(8pt)
      
      // Root node
      #if root != none [
        #circle(radius: 12pt, fill: blues.standard, stroke: 1pt + whites.standard)[
          #text(fill: whites.standard, weight: "bold")[#root]
        ]
        #v(6pt)
        
        // Connection lines and child nodes
        #if left != none or right != none [
          #grid(
            columns: (1fr, 1fr),
            gutter: 20pt,
            
            // Left child
            align(center)[
              #if left != none [
                #line(length: 25pt, angle: 45deg, stroke: 1pt + shades.gray.dark)
                #v(-8pt)
                #circle(radius: 10pt, fill: greens.standard)[
                  #text(fill: whites.standard, size: 9pt)[#left]
                ]
              ]
            ],
            
            // Right child  
            align(center)[
              #if right != none [
                #line(length: 25pt, angle: 135deg, stroke: 1pt + shades.gray.dark)
                #v(-8pt)
                #circle(radius: 10pt, fill: oranges.light)[
                  #text(fill: whites.standard, size: 9pt)[#right]
                ]
              ]
            ]
          )
        ]
      ] else [
        #text(style: "italic", fill: shades.gray.mid)[Empty Tree]
      ]
    ]
  ]
}

#let array(
  items: (),
  indices: true,
  title: "Array",
  highlight: none,
  size: "md"
) = {
  buildComponent(
    type: "array",
    variant: "default",
    size: size,
    config: (width: auto, padding: 8pt)
  )[
    #align(center)[
      #text(weight: "bold", size: 11pt)[#title]
      #v(6pt)
      
      #if indices [
        #grid(
          columns: (30pt,) * items.len(),
          gutter: 1pt,
          ..items.enumerate().map(((i, item)) => 
            align(center)[
              #text(size: 7pt, fill: shades.gray.dark)[#i]
            ]
          )
        )
        #v(2pt)
      ]
      
      #grid(
        columns: (30pt,) * items.len(),
        gutter: 1pt,
        ..items.enumerate().map(((i, item)) => 
          rect(
            width: 30pt,
            height: 25pt,
            fill: if highlight == i { yellows.bee } else { whites.standard },
            stroke: 1pt + shades.gray.dark,
            inset: 4pt
          )[
            #align(center)[#text(size: 9pt)[#item]]
          ]
        )
      )
      
      #v(4pt)
      #text(size: 8pt, style: "italic")[Length: #items.len()]
    ]
  ]
}