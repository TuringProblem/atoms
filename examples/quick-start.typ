#import "../lib.typ": *

= Atoms Quick Start Guide

== Super Simple Usage

// 1. Basic cards - just pass content and get beautiful results
#card([Hello World!], title: "My First Card")

#v(12pt)

// 2. Data-driven approach - pass arrays and let components handle the rest
#let myData = (
  (title: "Paper 1", content: "Amazing research on AI"),
  (title: "Paper 2", content: "Breakthrough in ML"),
  (title: "Paper 3", content: "Novel approach to NLP")
)

#cardGrid(myData, columns: 3, variant: "research")

#v(16pt)

// 3. Research components with zero configuration
#let papers = (
  (title: "Deep Learning", authors: "Goodfellow et al.", year: "2016", status: "published"),
  (title: "Attention Is All You Need", authors: "Vaswani et al.", year: "2017", status: "published"),
)

#bibliography(papers, style: "grid")

#v(16pt)

// 4. Timeline from simple data
#let milestones = (
  (title: "Start Project", date: "2024-01", status: "completed"),
  (title: "Write Paper", date: "2024-06", status: "current"),
  (title: "Submit", date: "2024-12", status: "pending")
)

#timeline(milestones)

== That's it! 

*Three key principles:*
1. *Simple APIs* - Just pass your data
2. *Automatic styling* - Components look great by default  
3. *Data-driven* - Arrays and dictionaries work seamlessly

*Start building amazing research documents!*