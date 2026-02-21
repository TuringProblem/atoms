#import "tokenizer.typ": tokenize
#import "parser.typ": parse-tokens, parse-css-classes, convert-layout-to-typst

= Debug Output

== Tokenizer Test
#let test-html = "<div class='p-4 bg-blue-100'>Hello world!</div>"
#let tokens = tokenize(test-html)

Tokens: #repr(tokens)

== Parser Test  
#let ast = parse-tokens(tokens)

AST: #repr(ast)

== CSS Style Test
#let test-styles = parse-css-classes("p-4 bg-blue-100")
Parsed CSS: #repr(test-styles)

#let typst-params = convert-layout-to-typst(test-styles)
Typst Params: #repr(typst-params)

== Simple Block Test
#block(fill: rgb(219, 234, 254), inset: 16pt)[Hello world with manual styling!]

== Direct Renderer Test
#let test-params = (inset: 16pt, fill: rgb(219, 234, 254))
#block(
  fill: test-params.at("fill", default: none),
  inset: test-params.at("inset", default: 0pt),
  [Test with extracted params]
)

== HTML Render Test
#import "renderer.typ": html
#html("<div class='p-4 bg-blue-100'>Hello world!</div>")