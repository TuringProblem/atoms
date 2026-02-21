#import "atoms-parser-v2.typ": parse-atoms-dsl

= Simple Debug

== Test Simple Case
#let simple = "<d 'p-4 bg-blue-100' -> {Hello World}>"
#let simple-ast = parse-atoms-dsl(simple)
Simple AST: #repr(simple-ast)

== Test Chain Case  
#let chain = "<d 'p-2 bg-red-100' -> {First} -> {Second}>"
#let chain-ast = parse-atoms-dsl(chain)
Chain AST: #repr(chain-ast)

== Test Nested Case
#let nested = "<d 'flex' -> {<d 'p-2' -> {Inner}>}>"
#let nested-ast = parse-atoms-dsl(nested)
Nested AST: #repr(nested-ast)