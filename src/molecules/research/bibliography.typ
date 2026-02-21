#import "../../core/component.typ": *
#import "../cards/enhanced-card.typ": card
#import "../../colors/colors.typ": *

// Research-focused bibliography and citation components

// Single citation card
#let citation(
  authors,
  title,
  venue: none,
  year: none,
  doi: none,
  notes: none,
  importance: "normal",
  config: (:)
) = {
  let variant = if importance == "key" { "research" }
                else if importance == "reference" { "ghost" }
                else { "default" }
  
  card(
    [
      #if notes != none [
        #text(style: "italic", size: 9pt)[#notes]
        #v(4pt)
      ]
      
      #if venue != none [
        #text(weight: "medium")[#venue]
        #if year != none [ (#year) ]
        #linebreak()
      ]
      
      #if doi != none [
        #text(size: 8pt, fill: blues.standard)[DOI: #doi]
      ]
    ],
    variant: variant,
    title: title,
    subtitle: authors,
    size: "sm",
    config: config
  )
}

// Bibliography grid from data
#let bibliography(
  citations,
  style: "grid",
  columns: 2,
  sort-by: "year",
  config: (:)
) = {
  let processedCitations = processData(citations, citation)
  
  // Sort if requested
  let sortedCitations = if sort-by != none {
    processedCitations.sorted(key: item => item.at(sort-by, default: ""))
  } else {
    processedCitations
  }
  
  if style == "grid" {
    grid(
      columns: columns,
      gutter: 12pt,
      ..sortedCitations.map(item => citation(
        item.at("authors", default: "Unknown Authors"),
        item.at("title", default: "Untitled"),
        venue: item.at("venue", default: none),
        year: item.at("year", default: none), 
        doi: item.at("doi", default: none),
        notes: item.at("notes", default: none),
        importance: item.at("importance", default: "normal"),
        config: config
      ))
    )
  } else {
    // List style
    for item in sortedCitations [
      #citation(
        item.at("authors", default: "Unknown Authors"),
        item.at("title", default: "Untitled"),
        venue: item.at("venue", default: none),
        year: item.at("year", default: none),
        doi: item.at("doi", default: none), 
        notes: item.at("notes", default: none),
        importance: item.at("importance", default: "normal"),
        config: config + (width: 100%)
      )
      #v(8pt)
    ]
  }
}

// Research reading list component
#let readingList(
  papers,
  title: "Reading List",
  show-status: true,
  config: (:)
) = {
  [
    #text(size: 16pt, weight: "bold")[#title]
    #v(12pt)
    
    #for paper in processData(papers, none) [
      #let status = paper.at("status", default: "unread")
      #let statusColor = if status == "read" { greens.standard }
                        else if status == "reading" { oranges.light }
                        else { shades.gray.mid }
      
      #grid(
        columns: if show-status { (20pt, 1fr) } else { (1fr,) },
        gutter: 8pt,
        if show-status [
          #circle(radius: 6pt, fill: statusColor)
        ],
        [
          #text(weight: "medium")[#paper.at("title", default: "Untitled")]
          #if paper.at("authors", default: none) != none [
            #linebreak()
            #text(size: 9pt, style: "italic")[#paper.at("authors")]
          ]
          #if paper.at("priority", default: none) != none [
            #h(8pt)
            #text(size: 8pt, fill: reds.standard)[● #paper.at("priority")]
          ]
        ]
      )
      #v(6pt)
    ]
  ]
}