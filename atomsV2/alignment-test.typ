#import "renderer.typ": html

#set page(margin: 1in)
#set text(font: "New Computer Modern")

= Alignment Test

== Default Center Alignment
#html("<div class='p-4 bg-blue-100'>This should be centered by default</div>")

== Override with justify-start (left)
#html("<div class='p-4 bg-red-100 justify-start'>This should be left-aligned</div>")

== Override with justify-end (right)  
#html("<div class='p-4 bg-green-100 justify-end'>This should be right-aligned</div>")

== Explicit justify-center
#html("<div class='p-4 bg-gray-100 justify-center'>This should be explicitly centered</div>")

== Nested with different alignments
#html("<div class='p-6 bg-blue-50 justify-start'>
  <div class='p-3 bg-red-100'>Nested (should be centered by default)</div>
</div>")