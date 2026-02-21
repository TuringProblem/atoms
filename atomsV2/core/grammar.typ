// Atoms DSL Grammar Definition
// Syntax: <tag 'classes' -> {content} -> {more content}>

#let atoms-tokens = (
  open-bracket: "<",
  close-bracket: ">", 
  arrow: "->",
  open-brace: "{",
  close-brace: "}",
  quote: "'",
  tag: "tag",
  classes: "classes",
  content: "content",
  whitespace: "whitespace"
)

// Grammar Rules:
// element := "<" tag classes? "->" content-block ("->", content-block)*  ">"
// content-block := "{" (text | element)* "}"
// classes := "'" class-list "'"
// class-list := abbreviation (" " abbreviation)*
// tag := "d" | "p" | "h1" | "h2" | "h3" | "span" | "section"

#let atoms-tags = (
  "d": "div",
  "p": "p", 
  "h1": "h1",
  "h2": "h2", 
  "h3": "h3",
  "h4": "h4",
  "span": "span",
  "s": "section",
  "a": "article",
  "header": "header",
  "footer": "footer",
  "nav": "nav"
)

#let class-abbreviations = (
  // Layout
  "flex": "flex",
  "f-c": "flex-col", 
  "f-r": "flex-row",
  "block": "block",
  "inline": "inline",
  "grid": "grid",
  
  // Justify content
  "j-s": "justify-start",
  "j-c": "justify-center", 
  "j-e": "justify-end",
  "j-b": "justify-between",
  "j-a": "justify-around",
  "j-ev": "justify-evenly",
  
  // Align items
  "i-s": "items-start",
  "i-c": "items-center",
  "i-e": "items-end",
  
  // Padding
  "p-0": "p-0", "p-1": "p-1", "p-2": "p-2", "p-3": "p-3", "p-4": "p-4", 
  "p-5": "p-5", "p-6": "p-6", "p-8": "p-8",
  "px-1": "px-1", "px-2": "px-2", "px-3": "px-3", "px-4": "px-4",
  "py-1": "py-1", "py-2": "py-2", "py-3": "py-3", "py-4": "py-4",
  
  // Margin  
  "m-0": "m-0", "m-1": "m-1", "m-2": "m-2", "m-3": "m-3", "m-4": "m-4",
  "m-5": "m-5", "m-6": "m-6", "m-8": "m-8",
  "mx-1": "mx-1", "mx-2": "mx-2", "mx-3": "mx-3", "mx-4": "mx-4",
  "my-1": "my-1", "my-2": "my-2", "my-3": "my-3", "my-4": "my-4",
  
  // Colors
  "bg-red-50": "bg-red-50", "bg-red-100": "bg-red-100", "bg-red-200": "bg-red-200", "bg-red-500": "bg-red-500",
  "bg-blue-50": "bg-blue-50", "bg-blue-100": "bg-blue-100", "bg-blue-200": "bg-blue-200", "bg-blue-500": "bg-blue-500", 
  "bg-green-50": "bg-green-50", "bg-green-100": "bg-green-100", "bg-green-200": "bg-green-200", "bg-green-500": "bg-green-500",
  "bg-gray-50": "bg-gray-50", "bg-gray-100": "bg-gray-100", "bg-gray-200": "bg-gray-200", "bg-gray-500": "bg-gray-500",
  "bg-yellow-100": "bg-yellow-100", "bg-white": "bg-white",
  
  // Text colors (abbreviated)
  "t-red": "text-red-500", "t-blue": "text-blue-500", "t-green": "text-green-500", 
  "t-gray": "text-gray-500", "t-grey": "text-gray-500", "t-white": "text-white", "t-black": "text-black",
  
  // Text sizes (abbreviated)
  "t-xs": "text-xs", "t-sm": "text-sm", "t-base": "text-base", 
  "t-lg": "text-lg", "t-xl": "text-xl", "t-2xl": "text-2xl", "t-3xl": "text-3xl",
  
  // Border
  "border": "border", "border-2": "border-2", "border-4": "border-4",
  "border-gray-200": "border-gray-200", "border-gray-300": "border-gray-300",
  "border-blue-200": "border-blue-200", "border-red-200": "border-red-200",
  
  // Border radius (abbreviated)
  "r": "rounded", "r-md": "rounded-md", "r-lg": "rounded-lg", "r-xl": "rounded-xl",
  
  // Sizing
  "w-full": "w-full", "w-1/2": "w-1/2", "w-1/3": "w-1/3", "w-2/3": "w-2/3", "w-1/4": "w-1/4", "w-3/4": "w-3/4",
  "h-8": "h-8", "h-12": "h-12", "h-16": "h-16", "h-24": "h-24", "h-32": "h-32"
)

// Atoms DSL Examples:
// <d 'flex j-c p-4' -> {Hello World}>
// <d 'p-6 bg-blue' -> {Content 1} -> {Content 2}>
// <d 'flex j-b' -> {<d 'p-2' -> {Left}> <d 'p-2' -> {Right}>}>

#let create-atoms-token(type, value, start-pos: 0, end-pos: 0) = (
  type: type,
  value: value,
  start: start-pos,
  end: end-pos
)