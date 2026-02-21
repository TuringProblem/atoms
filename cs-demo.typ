#import "lib.typ": *

#set page(margin: 0.8in)
#set text(size: 10pt)
#set par(justify: true)

#align(center)[
  #text(size: 28pt, weight: "bold", fill: blues.standard)[Atoms CS Library]
  #v(8pt)
  #text(size: 14pt, style: "italic")[Fast Note-Taking for Computer Science Classes]
  #v(4pt)
  #text(size: 10pt, fill: shades.gray.dark)[Data Structures • Algorithms • UML • Quick Notes]
]

#v(24pt)

= 📚 Sectioned Cards - The Core System

This is exactly what you wanted! Cards with structured sections for CS concepts:

```typst
#let quickSortCard = (
  header: (title: "Quick Sort", complexity: "O(n log n)"),
  main: (description: "...", code: "...", example: "..."),
  footer: (notes: "Divide and conquer approach")
)
```

== Algorithm Cards

#grid(
  columns: 2,
  gutter: 16pt,
  
  algorithmCard(
    "Quick Sort",
    complexity: "O(n log n) avg, O(n²) worst",
    description: "Divide-and-conquer sorting algorithm that picks a pivot and partitions array.",
    pseudocode: "function quickSort(arr, low, high):\n    if low < high:\n        pi = partition(arr, low, high)\n        quickSort(arr, low, pi - 1)\n        quickSort(arr, pi + 1, high)",
    example: "Array [3,1,4,1,5] → [1,1,3,4,5]",
    notes: "In-place sorting, not stable"
  ),
  
  algorithmCard(
    "Binary Search", 
    complexity: "O(log n)",
    description: "Search algorithm that finds position by repeatedly dividing search interval in half.",
    pseudocode: "function binarySearch(arr, target):\n    left, right = 0, len(arr) - 1\n    while left <= right:\n        mid = (left + right) // 2\n        if arr[mid] == target: return mid\n        elif arr[mid] < target: left = mid + 1\n        else: right = mid - 1\n    return -1",
    example: "Find 7 in [1,3,5,7,9,11] → index 3",
    notes: "Requires sorted array"
  )
)

#v(16pt)

= 🔢 Data Structure Visualizations

Perfect for understanding concepts during lectures:

== Stacks (LIFO)

#grid(
  columns: 3,
  gutter: 16pt,
  
  stack(
    items: ("main()", "foo()", "bar()"),
    title: "Call Stack",
    highlight-top: true
  ),
  
  stack(
    items: ("5", "3", "8", "1"),
    title: "Number Stack",
    highlight-top: false
  ),
  
  stack(
    items: (),
    title: "Empty Stack"
  )
)

#v(12pt)

== Queues (FIFO)

#grid(
  columns: 2,
  gutter: 20pt,
  
  queue(
    items: ("Task A", "Task B", "Task C"),
    title: "Process Queue"
  ),
  
  queue(
    items: ("Request 1", "Request 2"),
    title: "HTTP Queue"
  )
)

#v(12pt)

== Arrays & Linked Lists

#grid(
  columns: 2,
  gutter: 16pt,
  
  [
    #array(
      items: ("10", "20", "30", "40"),
      title: "Array",
      highlight: 2,
      indices: true
    )
    #v(8pt)
    #text(size: 8pt, style: "italic")[Highlighted: index 2]
  ],
  
  linkedList(
    items: ("A", "B", "C"),
    title: "Linked List"
  )
)

#v(12pt)

== Trees

#grid(
  columns: 2,
  gutter: 24pt,
  
  binaryTree(
    root: "50",
    left: "30", 
    right: "70",
    title: "Binary Tree"
  ),
  
  binaryTree(
    root: "Root",
    left: "L",
    right: "R", 
    title: "Simple Tree"
  )
)

#pagebreak()

= 🎯 Data Structure Cards with Visualizations

Combining sectioned cards with visual elements:

#grid(
  columns: 2,
  gutter: 16pt,
  
  dataStructureCard(
    "Stack",
    complexity: "O(1) push/pop",
    description: "Last In, First Out (LIFO) data structure. Elements added and removed from same end.",
    visualization: stack(
      items: ("Third", "Second", "First"),
      title: "",
      size: "sm"
    ),
    operations: "push(), pop(), peek(), isEmpty()",
    notes: "Used in function calls, expression evaluation, undo operations"
  ),
  
  dataStructureCard(
    "Hash Table",
    complexity: "O(1) avg lookup",
    description: "Key-value pairs with fast lookup using hash function.",
    visualization: array(
      items: ("K1:V1", "", "K2:V2", ""),
      title: "Hash Array",
      size: "sm"
    ),
    operations: "put(k,v), get(k), remove(k)",
    notes: "Handle collisions with chaining or open addressing"
  )
)

#v(16pt)

= 💡 Concept Cards for Quick Notes

#grid(
  columns: 2,
  gutter: 16pt,
  
  conceptCard(
    "Big O Notation",
    definition: "Mathematical notation describing limiting behavior of algorithm time/space complexity.",
    example: "O(1) < O(log n) < O(n) < O(n²) < O(2ⁿ)",
    applications: "Algorithm analysis, performance comparison, optimization decisions"
  ),
  
  conceptCard(
    "Recursion",
    definition: "Function that calls itself with smaller subproblem until base case reached.",
    example: "factorial(n) = n × factorial(n-1), base: factorial(0) = 1",
    applications: "Tree traversal, divide-and-conquer, backtracking"
  )
)

#v(16pt)

= 💻 Code Snippet Cards

#grid(
  columns: 2,
  gutter: 16pt,
  
  codeCard(
    "Python List Comprehension",
    "[x**2 for x in range(10) if x % 2 == 0]",
    language: "python",
    explanation: "Create list of squares for even numbers 0-9",
    output: "[0, 4, 16, 36, 64]"
  ),
  
  codeCard(
    "Java ArrayList",
    "ArrayList<String> list = new ArrayList<>();\nlist.add(\"Hello\");\nlist.get(0);",
    language: "java",
    explanation: "Dynamic array implementation",
    output: "Hello"
  )
)

#pagebreak()

= 📊 UML Diagrams for Design

Quick UML sketches during software design lectures:

== Class Diagrams

#grid(
  columns: 3,
  gutter: 12pt,
  
  umlClass(
    "Student",
    attributes: (
      "- id: int",
      "- name: String",
      "- gpa: double"
    ),
    methods: (
      "+ getId(): int",
      "+ setName(String): void",
      "+ calculateGPA(): double"
    )
  ),
  
  umlClass(
    "Course",
    attributes: (
      "- code: String",
      "- credits: int"
    ),
    methods: (
      "+ enroll(Student): void",
      "+ getCredits(): int"
    )
  ),
  
  umlClass(
    "",
    attributes: (
      "- id: int",
      "- name: String",
    ),
    methods: (
      "+ method1(): void",
      "+ method2(): int"
    ),
    stereotype: "interface"
  )
)

#v(8pt)

#umlRelation(
  from: "Student",
  to: "Course", 
  type: "association",
  label: "enrolls in",
  horizontal: true
)

#v(16pt)

== State Diagrams

#stateDiagram(
  states: (
    (name: "Idle", initial: true),
    (name: "Running"),
    (name: "Done", final: true)
  ),
  transitions: (
    (from: "Idle", to: "Running", condition: "start"),
    (from: "Running", to: "Done", condition: "finish"),
    (from: "Running", to: "Idle", condition: "pause")
  ),
  title: "Process State Machine"
)

#v(16pt)

== Use Cases

#grid(
  columns: 3,
  gutter: 12pt,
  
  useCase(
    "Login",
    actors: ("User",),
    description: "User authenticates with system"
  ),
  
  useCase(
    "Create Post",
    actors: ("Author", "Admin"),
    description: "Create new blog post"
  ),
  
  useCase(
    "View Analytics",
    actors: ("Manager",),
    description: "View site statistics"
  )
)

#v(16pt)

== Sequence Diagram

#sequenceDiagram(
  actors: ("User", "Frontend", "Backend", "Database"),
  messages: (
    (from: "User", to: "Frontend", text: "login(username, password)"),
    (from: "Frontend", to: "Backend", text: "authenticate()"),
    (from: "Backend", to: "Database", text: "validateUser()"),
    (from: "Database", to: "Backend", text: "userValid"),
    (from: "Backend", to: "Frontend", text: "authToken"),
    (from: "Frontend", to: "User", text: "loginSuccess")
  ),
  title: "Login Flow"
)

#pagebreak()

= 🚀 Fast Lecture Notes Example

Here's how you'd take notes during a Data Structures lecture:

== Today's Topic: Hash Tables

#algorithmCard(
  "Hash Function",
  complexity: "O(1)",
  description: "Maps keys to array indices using mathematical function.",
  pseudocode: "hash(key) = key % table_size",
  example: "hash('apple') = hash_code('apple') % 10 = 7",
  notes: "Good hash function minimizes collisions"
)

#v(8pt)

#grid(
  columns: 2,
  gutter: 16pt,
  
  conceptCard(
    "Collision Resolution",
    definition: "Handling when two keys hash to same index.",
    example: "Chaining: store multiple values at same index in linked list",
    applications: "Separate chaining, linear probing, quadratic probing"
  ),
  
  [
    === Hash Table Operations
    #array(
      items: ("null", "data1", "null", "data2", "null"),
      title: "Hash Array",
      indices: true
    )
    #v(4pt)
    #text(size: 8pt)[
      *Insert:* hash(key) → index → store value
      
      *Search:* hash(key) → index → check value
      
      *Delete:* hash(key) → index → remove value
    ]
  ]
)

#v(12pt)

=== Collision Example

#codeCard(
  "Handling Collisions",
  "def insert(key, value):\n    index = hash(key) % size\n    if table[index] is None:\n        table[index] = [(key, value)]\n    else:\n        table[index].append((key, value))",
  language: "python",
  explanation: "Chaining approach - each slot contains list of key-value pairs"
)

#v(16pt)

= 📝 Summary

#text(weight: "bold")[Atoms CS Library gives you:]

• #text(weight: "bold")[Sectioned Cards] - Structured format exactly like you wanted: `(header: ..., main: ..., footer: ...)`
• #text(weight: "bold")[Data Structure Visualizations] - Stacks, queues, trees, arrays, linked lists
• #text(weight: "bold")[UML Diagrams] - Classes, state machines, use cases, sequence diagrams  
• #text(weight: "bold")[Algorithm Cards] - Complexity, pseudocode, examples, notes
• #text(weight: "bold")[Code Snippets] - Syntax-highlighted code blocks with explanations
• #text(weight: "bold")[Fast Note-Taking] - Perfect for CS lectures and study sessions

#text(weight: "bold")[Just define your data and get beautiful, structured CS notes!]