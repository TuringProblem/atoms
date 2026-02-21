#import "../../core/component.typ": processData

// Data streaming utilities for Atoms components

// Transform data through multiple functions
#let pipe(data, ..transforms) = {
  transforms.pos().fold(data, (acc, transform) => transform(acc))
}

// Filter data based on conditions
#let filter(data, condition) = {
  processData(data, none).filter(condition)
}

// Group data by a key
#let groupBy(data, key) = {
  let processed = processData(data, none)
  let groups = (:)
  
  for item in processed {
    let groupKey = item.at(key, default: "other")
    if groupKey not in groups {
      groups.insert(groupKey, ())
    }
    groups.at(groupKey).push(item)
  }
  
  groups
}

// Sort data by a key
#let sortBy(data, key, reverse: false) = {
  let processed = processData(data, none)
  let sorted = processed.sorted(key: item => item.at(key, default: ""))
  if reverse { sorted.rev() } else { sorted }
}

// Quick data transformers
#let transformers = (
  // Add status based on date
  addTimeStatus: (data) => {
    processData(data, none).map(item => {
      let date = item.at("date", default: none)
      let status = if date != none {
        // Simple date comparison (assumes YYYY-MM-DD format)
        if date < "2024-01-01" { "completed" }
        else if date > "2024-12-31" { "future" }
        else { "current" }
      } else { "unknown" }
      
      item + (timeStatus: status)
    })
  },
  
  // Extract years from dates
  extractYear: (data) => {
    processData(data, none).map(item => {
      let date = item.at("date", default: none)
      let year = if date != none and date.len() >= 4 {
        date.slice(0, 4)
      } else { "Unknown" }
      
      item + (year: year)
    })
  },
  
  // Add priority indicators
  addPriority: (data) => {
    processData(data, none).map(item => {
      let keywords = item.at("keywords", default: ())
      let priority = if "urgent" in keywords { "high" }
                    else if "important" in keywords { "medium" }
                    else { "normal" }
      
      item + (priority: priority)
    })
  }
)

// Quick data sources (for prototyping)
#let sampleData = (
  papers: (
    (
      title: "Machine Learning in Academic Writing",
      authors: "Smith et al.",
      venue: "ICML 2024", 
      year: "2024",
      status: "published",
      importance: "key"
    ),
    (
      title: "A Survey of Typesetting Systems", 
      authors: "Johnson, M.",
      venue: "TUG 2023",
      year: "2023",
      status: "published",
      importance: "reference"
    ),
    (
      title: "Future of Document Preparation",
      authors: "Chen, L. and Davis, K.",
      venue: "DocEng 2024",
      year: "2024", 
      status: "draft",
      importance: "normal"
    )
  ),
  
  milestones: (
    (
      title: "Literature Review",
      date: "2024-01-15",
      description: "Complete comprehensive literature review on topic",
      status: "completed"
    ),
    (
      title: "Methodology Design",
      date: "2024-03-01", 
      description: "Design and validate experimental methodology",
      status: "current"
    ),
    (
      title: "Data Collection",
      date: "2024-05-15",
      description: "Gather experimental data and run initial analysis", 
      status: "pending"
    ),
    (
      title: "Paper Writing",
      date: "2024-08-01",
      description: "Write and revise paper manuscript",
      status: "pending"
    )
  ),
  
  readings: (
    (
      title: "Deep Learning Fundamentals",
      authors: "LeCun et al.",
      status: "read",
      priority: "high"
    ),
    (
      title: "Statistical Methods in ML",
      authors: "Hastie & Tibshirani", 
      status: "reading",
      priority: "medium"
    ),
    (
      title: "Advanced Neural Networks",
      authors: "Goodfellow et al.",
      status: "unread", 
      priority: "high"
    )
  )
)

// Data pipeline builder
#let pipeline(data) = (
  data: data,
  
  filter: (self, condition) => pipeline(filter(self.data, condition)),
  sort: (self, key, reverse: false) => pipeline(sortBy(self.data, key, reverse: reverse)),
  group: (self, key) => groupBy(self.data, key),
  transform: (self, transformer) => pipeline(transformer(self.data)),
  pipe: (self, ..transforms) => pipeline(pipe(self.data, ..transforms.pos())),
  
  get: (self) => self.data
)