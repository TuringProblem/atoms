#import "atoms-tokenizer.typ": tokenize-atoms, parse-atoms-classes
#import "atoms-parser-fixed.typ": parse-atoms-tokens
#import "atoms-to-html.typ": atoms-to-html

= Debug Atoms Pipeline

== Test Input
#let test-atoms = "<d 'p-4 bg-blue-100' -> {Hello World}>"

== Tokenizer Output
#let tokens = tokenize-atoms(test-atoms)
Tokens: #repr(tokens)

== Parser Output  
#let ast = parse-atoms-tokens(tokens)
AST: #repr(ast)

== HTML Output
#let html-result = atoms-to-html(test-atoms)
HTML: #repr(html-result)

== Class Abbreviation Test
#let test-classes = parse-atoms-classes("p-4 bg-blue-100")
Expanded: #repr(test-classes)

== Final Render Test
#import "css-renderer.typ": html
#html(html-result)