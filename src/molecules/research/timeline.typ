#import "../../core/component.typ": *
#import "../cards/enhanced-card.typ": card
#import "../../colors/colors.typ": *

// Research timeline and milestone components

// Single milestone
#let milestone(
  title,
  date,
  description: none,
  status: "pending",
  type: "default",
  config: (:)
) = {
  let statusColor = if status == "completed" { greens.standard }
                   else if status == "current" { blues.standard }
                   else if status == "overdue" { reds.standard }
                   else { shades.gray.mid }
  
  let variant = if status == "completed" { "published" }
               else if status == "current" { "research" }
               else if status == "overdue" { "draft" }
               else { "ghost" }
  
  grid(
    columns: (40pt, 1fr),
    gutter: 12pt,
    
    // Timeline dot and line
    align(center)[
      #circle(radius: 8pt, fill: statusColor, stroke: 2pt + whites.standard)
      #if status != "completed" [
        #v(4pt)
        #line(angle: 90deg, length: 30pt, stroke: 2pt + shades.gray.light)
      ]
    ],
    
    // Content card
    card(
      [
        #if description != none [
          #description
        ] else [
          #text(style: "italic")[No details provided]
        ]
      ],
      variant: variant,
      title: title,
      subtitle: date,
      size: "sm",
      width: 100%,
      config: config
    )
  )
}

// Timeline from data array
#let timeline(
  milestones,
  title: none,
  sort-by-date: true,
  config: (:)
) = {
  let processed = processData(milestones, milestone)
  
  let sorted = if sort-by-date {
    // Simple sort by date string (works for ISO dates)
    processed.sorted(key: item => item.at("date", default: ""))
  } else {
    processed
  }
  
  [
    #if title != none [
      #text(size: 16pt, weight: "bold")[#title]
      #v(16pt)
    ]
    
    #for item in sorted [
      #milestone(
        item.at("title", default: "Untitled"),
        item.at("date", default: "No date"),
        description: item.at("description", default: none),
        status: item.at("status", default: "pending"),
        type: item.at("type", default: "default"),
        config: config
      )
      #v(8pt)
    ]
  ]
}

// Research phase tracker
#let phaseTracker(
  phases,
  current-phase: 0,
  config: (:)
) = {
  let processed = processData(phases, none)
  
  grid(
    columns: processed.len(),
    gutter: 8pt,
    
    ..processed.enumerate().map(((i, phase)) => {
      let status = if i < current-phase { "completed" }
                  else if i == current-phase { "current" }
                  else { "pending" }
      
      let bgColor = if status == "completed" { greens.standard }
                   else if status == "current" { blues.standard }
                   else { shades.gray.light }
      
      align(center)[
        #circle(
          radius: 12pt, 
          fill: bgColor,
          stroke: 2pt + whites.standard
        )
        #v(4pt)
        #text(size: 8pt, weight: "medium")[
          #phase.at("name", default: str(i + 1))
        ]
        #if phase.at("duration", default: none) != none [
          #linebreak()
          #text(size: 7pt, fill: shades.gray.dark)[
            #phase.duration
          ]
        ]
      ]
    })
  )
}

// Progress indicator
#let progressBar(
  completed: 0,
  total: 100,
  label: none,
  variant: "default",
  config: (:)
) = {
  let percentage = calc.min(100, (completed / total) * 100)
  let barColor = if variant == "success" { greens.standard }
                else if variant == "warning" { oranges.light }
                else if variant == "danger" { reds.standard }
                else { blues.standard }
  
  [
    #if label != none [
      #text(size: 10pt, weight: "medium")[#label]
      #h(1fr)
      #text(size: 9pt)[#completed/#total (#calc.round(percentage))%)]
      #v(4pt)
    ]
    
    #rect(
      width: 100%,
      height: 8pt,
      fill: shades.gray.lighter,
      radius: 4pt,
    )
    #place(
      rect(
        width: percentage * 1%,
        height: 8pt,
        fill: barColor,
        radius: 4pt,
      )
    )
  ]
}