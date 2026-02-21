#import "lib.typ": *

#set page(margin: 0.8in)
#set text(size: 10pt)
#set par(justify: true)

#align(center)[
  #text(size: 28pt, weight: "bold", fill: blues.standard)[Atoms UI Library]
  #v(8pt)
  #text(size: 14pt, style: "italic")[Data-Driven Components for Research Documents]
  #v(4pt)
  #text(size: 10pt, fill: shades.gray.dark)[Demo of New Enhanced Features]
]

#v(24pt)

= 🚀 Quick Start - Zero Configuration Required

The new Atoms makes beautiful research documents with minimal code. Just pass your data!

== Basic Cards

#grid(
  columns: 3,
  gutter: 12pt,
  
  card(
    [Simple content with automatic styling and theming.],
    title: "Default Card"
  ),
  
  card(
    [Research variant with academic color scheme and accent borders.],
    title: "Research Card",
    variant: "research"
  ),
  
  card(
    [Draft papers get orange styling to indicate work-in-progress status.],
    title: "Draft Paper", 
    variant: "draft"
  )
)

#v(16pt)

== Instant Paper Management

```typst
// Just define your data and let Atoms handle the rest
#let myPapers = (
  (title: "AI in Academic Writing", authors: "Smith, J.", year: "2024", status: "published"),
  (title: "Future of Document Systems", authors: "Chen, L.", year: "2024", status: "draft")
)

#cardGrid(myPapers) // That's it! Beautiful cards automatically generated
```

#let myPapers = (
  (title: "Machine Learning for Document Processing", authors: "Smith, J. & Williams, K.", year: "2024", status: "published"),
  (title: "Advanced Typesetting Systems", authors: "Chen, L.", year: "2024", status: "draft"),
  (title: "Future of Academic Publishing", authors: "Davis, M. et al.", year: "2023", status: "published"),
  (title: "Automated Research Workflows", authors: "Johnson, P.", year: "2024", status: "review")
)

#cardGrid(
  myPapers.map(paper => (
    title: paper.title,
    content: [#text(style: "italic")[#paper.authors] • #paper.year],
    variant: if paper.status == "published" { "published" } 
             else if paper.status == "review" { "review" }
             else { "draft" },
    footer: "Status: " + paper.status
  )),
  columns: 2
)

#pagebreak()

= 📚 Research Bibliography System

== Citation Management

The new bibliography system handles all your references with beautiful, consistent formatting:

#let citations = (
  (
    authors: "LeCun, Y., Bengio, Y., & Hinton, G.",
    title: "Deep Learning",
    venue: "Nature",
    year: "2015",
    doi: "10.1038/nature14539",
    importance: "key",
    notes: "Foundational paper on deep learning architectures and applications."
  ),
  (
    authors: "Vaswani, A. et al.",
    title: "Attention Is All You Need", 
    venue: "NIPS",
    year: "2017",
    doi: "10.5555/3295222.3295349",
    importance: "key",
    notes: "Introduced the Transformer architecture that revolutionized NLP."
  ),
  (
    authors: "Devlin, J. et al.",
    title: "BERT: Pre-training of Deep Bidirectional Transformers",
    venue: "NAACL",
    year: "2019", 
    importance: "reference"
  )
)

#bibliography(citations, columns: 1, style: "list", sort-by: "year")

#v(16pt)

== Reading List Tracking

#grid(
  columns: 2,
  gutter: 20pt,
  
  [
    #readingList(
      (
        (title: "Deep Learning", authors: "Goodfellow et al.", status: "read", priority: "high"),
        (title: "Pattern Recognition", authors: "Bishop, C.", status: "reading", priority: "medium"),
        (title: "Information Theory", authors: "MacKay, D.", status: "unread", priority: "high"),
        (title: "Statistical Learning", authors: "Hastie et al.", status: "unread", priority: "low")
      ),
      title: "Priority Reading List",
      show-status: true
    )
  ],
  
  [
    === Quick Citation Cards
    #citation(
      "Brown, T. et al.",
      "Language Models are Few-Shot Learners",
      venue: "NeurIPS",
      year: "2020",
      importance: "key",
      notes: "GPT-3 paper demonstrating few-shot learning capabilities."
    )
    
    #v(8pt)
    
    #citation(
      "Dosovitskiy, A. et al.", 
      "An Image is Worth 16x16 Words",
      venue: "ICLR",
      year: "2021",
      importance: "reference"
    )
  ]
)

#pagebreak()

= 📅 Research Timeline & Progress

== Project Timeline

Visual timeline of research milestones with automatic status coloring:

#let researchTimeline = (
  (
    title: "Literature Review",
    date: "2024-01-15", 
    description: "Complete comprehensive survey of existing deep learning methods for document processing. Focus on transformer architectures.",
    status: "completed"
  ),
  (
    title: "Methodology Design",
    date: "2024-03-01",
    description: "Design experimental framework including datasets, evaluation metrics, and baseline comparisons.",
    status: "completed"
  ),
  (
    title: "Implementation Phase",
    date: "2024-05-15",
    description: "Implement proposed model architecture and training pipeline. Set up experimental infrastructure.",
    status: "current"
  ),
  (
    title: "Evaluation & Analysis",
    date: "2024-07-30",
    description: "Run comprehensive experiments, statistical analysis, and performance evaluation against baselines.",
    status: "pending"
  ),
  (
    title: "Paper Writing",
    date: "2024-09-15", 
    description: "Draft manuscript, create figures, and prepare submission materials for target venue.",
    status: "pending"
  ),
  (
    title: "Submission & Review",
    date: "2024-11-01",
    description: "Submit to conference, address reviewer comments, and prepare final camera-ready version.",
    status: "pending"
  )
)

#timeline(researchTimeline, title: "PhD Research Timeline")

#v(20pt)

== Progress Tracking

#grid(
  columns: 2,
  gutter: 24pt,
  
  [
    === Research Phases
    #phaseTracker(
      (
        (name: "Planning", duration: "2 months"),
        (name: "Research", duration: "6 months"),
        (name: "Analysis", duration: "3 months"), 
        (name: "Writing", duration: "3 months")
      ),
      current-phase: 1
    )
    
    #v(12pt)
    
    === Detailed Progress
    #progressBar(completed: 100, total: 100, label: "Literature Review", variant: "success")
    #v(6pt)
    #progressBar(completed: 85, total: 100, label: "Methodology Design", variant: "success") 
    #v(6pt)
    #progressBar(completed: 45, total: 100, label: "Implementation", variant: "default")
    #v(6pt)
    #progressBar(completed: 15, total: 100, label: "Data Collection", variant: "warning")
    #v(6pt)
    #progressBar(completed: 5, total: 100, label: "Analysis & Results", variant: "danger")
  ],
  
  [
    === Key Milestones
    #card(
      [
        ✅ *Completed:* 
        - Comprehensive literature review (127 papers)
        - Research methodology approved by advisor
        - IRB approval obtained for human subjects
        
        🔄 *In Progress:*
        - Model implementation (60% complete)
        - Baseline experiments running
        
        ⏳ *Upcoming:*
        - Large-scale evaluation (July)
        - Conference submission (November)
      ],
      title: "Research Status",
      variant: "research", 
      size: "lg"
    )
  ]
)

#pagebreak()

= 🔧 Advanced Data Processing

== Data Pipeline Example

The new data streaming system makes complex operations simple:

```typst
// Complex data processing in simple, readable steps
#let recentKeyPapers = pipeline(allCitations)
  .filter(paper => paper.importance == "key")
  .filter(paper => int(paper.year) >= 2020)
  .sort("year", reverse: true)
  .get()

#bibliography(recentKeyPapers, style: "grid")
```

#let allCitations = citations + (
  (authors: "OpenAI", title: "GPT-4 Technical Report", year: "2023", importance: "key"),
  (authors: "Touvron, H. et al.", title: "LLaMA: Open Foundation Models", year: "2023", importance: "key"),
  (authors: "Chowdhery, A. et al.", title: "PaLM: Scaling Language Modeling", year: "2022", importance: "reference")
)

#let recentKeyPapers = pipeline(allCitations)
  .filter(paper => paper.importance == "key")
  .filter(paper => int(paper.year) >= 2020)
  .sort("year", reverse: true)
  .get()

=== Recent Key Papers (2020+)
#bibliography(recentKeyPapers, style: "grid", columns: 2)

#v(16pt)

== Grouped Data Display

#let papersByYear = groupBy(allCitations, "year")

#for (year, papers) in papersByYear.pairs().sorted(key: ((year, papers)) => year).rev() [
  === #year Publications (#papers.len() papers)
  #cardGrid(
    papers.map(paper => (
      title: paper.at("title", default: "Untitled"),
      content: paper.at("authors", default: "Unknown Authors"),
      variant: if paper.at("importance", default: "normal") == "key" { "research" } else { "ghost" },
      size: "sm"
    )),
    columns: 3
  )
  #v(8pt)
]

#v(16pt)

= 🎨 Theming & Customization

== Variant Showcase

All components support consistent variants with semantic meaning:

#grid(
  columns: 4,
  gutter: 8pt,
  
  card([Default styling], title: "Default", size: "sm"),
  card([Academic focus], title: "Research", variant: "research", size: "sm"),
  card([Work in progress], title: "Draft", variant: "draft", size: "sm"), 
  card([Under review], title: "Review", variant: "review", size: "sm")
)

#v(8pt)

#grid(
  columns: 4,
  gutter: 8pt,
  
  card([Completed work], title: "Published", variant: "published", size: "sm"),
  card([Minimal styling], title: "Ghost", variant: "ghost", size: "sm"),
  card([Large format], title: "Large Card", size: "lg"),
  card([Small format], title: "Compact", size: "sm")
)

#v(16pt)

== Paper Card Shorthand

For quick paper layouts, use the specialized `paperCard` component:

#grid(
  columns: 2,
  gutter: 16pt,
  
  paperCard(
    "Transformer Models for Academic Document Analysis",
    authors: "Smith, J., Chen, L., & Davis, M.",
    abstract: "This paper presents novel transformer architectures specifically designed for academic document processing, showing significant improvements over existing methods.",
    year: "2024",
    status: "published"
  ),
  
  paperCard(
    "Large Language Models in Research Workflows", 
    authors: "Johnson, K. et al.",
    abstract: "We explore the integration of large language models into research workflows, demonstrating automated literature review and citation management capabilities.",
    year: "2024",
    status: "draft"
  )
)

#v(24pt)

= 📋 Summary

#card(
  [
    The enhanced Atoms library brings powerful, data-driven components to Typst with these key benefits:
    
    • *Simple APIs*: Just pass your data - components handle styling automatically
    • *Research Focus*: Built-in bibliography, timeline, and progress tracking
    • *Data Streaming*: Powerful pipeline operations for complex data processing  
    • *Consistent Theming*: Unified color schemes and typography across all components
    • *Zero Configuration*: Beautiful results out of the box, customizable when needed
    
    Perfect for research papers, thesis documents, project reports, and academic presentations.
  ],
  title: "🎯 Atoms: Data-Driven Research Components",
  variant: "research",
  size: "lg"
)

#v(12pt)

#align(center)[
  #text(size: 12pt, style: "italic", fill: shades.gray.dark)[
    Start building amazing research documents with just a few lines of code!
  ]
]