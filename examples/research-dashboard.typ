#import "../src/molecules/cards/enhanced-card.typ": *
#import "../src/molecules/research/bibliography.typ": *
#import "../src/molecules/research/timeline.typ": *
#import "../src/util/data/stream.typ": *

// Research Dashboard Example - showcasing the new data-driven Atoms components

#set page(margin: 1in)
#set text(font: "Inter", size: 10pt)

= Research Dashboard Example

This example showcases how simple and powerful Atoms components are with the new data-driven system.

== Simple Card Usage

// Single cards with clean API
#grid(
  columns: 2,
  gutter: 16pt,
  
  card(
    [This is a simple default card with automatic theming and spacing.],
    title: "Default Card",
    subtitle: "Clean and simple"
  ),
  
  card(
    [Research cards automatically style for academic use with accent colors.],
    variant: "research", 
    title: "Research Card",
    subtitle: "Academic styling"
  )
)

#v(24pt)

== Data-Driven Components

// Feed data directly to components - no complex setup needed
#let myPapers = (
  (title: "AI in Document Processing", authors: "Smith, J.", year: "2024", status: "published"),
  (title: "Future of Academic Writing", authors: "Davis, K.", year: "2024", status: "draft"),
  (title: "Automated Typesetting Systems", authors: "Chen, L.", year: "2023", status: "published")
)

=== Paper Collection
#cardGrid(
  myPapers.map(paper => (
    title: paper.title,
    content: [Authors: #paper.authors],
    subtitle: paper.year,
    variant: if paper.status == "published" { "published" } else { "draft" }
  )),
  columns: 3
)

#v(24pt)

== Research Timeline

// Timeline from simple data arrays
#let researchMilestones = (
  (title: "Literature Review", date: "2024-01", description: "Complete survey of existing methods", status: "completed"),
  (title: "Experiment Design", date: "2024-03", description: "Design experimental framework", status: "current"), 
  (title: "Data Collection", date: "2024-06", description: "Gather and validate datasets", status: "pending"),
  (title: "Analysis & Results", date: "2024-09", description: "Statistical analysis and interpretation", status: "pending")
)

#timeline(researchMilestones, title: "Research Timeline")

#v(24pt)

== Progress Tracking

#grid(
  columns: 2,
  gutter: 24pt,
  
  // Phase tracker
  [
    === Project Phases
    #phaseTracker(
      (
        (name: "Planning", duration: "2 months"),
        (name: "Research", duration: "4 months"), 
        (name: "Analysis", duration: "3 months"),
        (name: "Writing", duration: "2 months")
      ),
      current-phase: 1
    )
  ],
  
  // Progress bars
  [
    === Current Progress
    #progressBar(75, 100, label: "Literature Review", variant: "success")
    #v(8pt)
    #progressBar(30, 100, label: "Methodology", variant: "default")
    #v(8pt)
    #progressBar(10, 100, label: "Data Collection", variant: "warning")
  ]
)

#v(24pt)

== Bibliography with Data Pipeline

// Powerful data processing with simple syntax
#let allCitations = sampleData.papers

#let importantPapers = pipeline(allCitations)
  .filter(paper => paper.importance == "key" or paper.year == "2024")
  .sort("year", reverse: true)
  .get()

=== Key Recent Papers
#bibliography(importantPapers, columns: 1, style: "list")

#v(24pt)

== Reading List Management

#let readingStatus = sampleData.readings

#grid(
  columns: 2,
  gutter: 24pt,
  
  [
    === Current Reading List
    #readingList(readingStatus, title: "Priority Papers")
  ],
  
  [
    === Citation Cards
    #for paper in importantPapers.slice(0, 2) [
      #citation(
        paper.authors,
        paper.title,
        venue: paper.venue,
        year: paper.year,
        importance: paper.importance
      )
      #v(8pt)
    ]
  ]
)

#v(24pt)

== Advanced: Custom Data Transformations

// Complex data processing made simple
#let processedData = pipeline(sampleData.papers)
  .transform(transformers.extractYear)
  .filter(paper => int(paper.year) >= 2024)
  .sort("title")
  .get()

=== 2024+ Papers (Auto-processed)
#cardGrid(
  processedData.map(paper => (
    title: paper.title,
    content: [#paper.venue • #paper.year],
    variant: "research",
    footer: "Status: " + paper.status
  )),
  columns: 3,
  size: "sm"
)

#v(24pt)

== Summary

*Key Features Demonstrated:*
- Simple, clean APIs for all components
- Data streams naturally through components
- Automatic theming and consistent styling
- Powerful data processing with pipelines
- Research-focused components out of the box
- Extensible variant system

*Just pass your data and get beautiful, consistent results!*