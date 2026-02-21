#import "renderer.typ": html

#set page(margin: 1in)
#set text(font: "New Computer Modern")

= HTML-to-Typst Transpiler Demo

== Basic Usage

#html("<div class='p-4 bg-blue-100'>Hello world with padding and blue background!</div>")

== Nested Elements

#html("<div class='p-6 bg-gray-100'><div class='p-2 bg-red-100'>Nested content with different styling</div>Outside the nested div</div>")

== Multiple Classes

#html("<div class='p-3 m-2 bg-green-100 text-lg'>Large text with padding, margin, and green background</div>")

== Plain Text Handling

#html("Just plain text without any HTML tags")

== Mixed Content

#html("Some text before <div class='p-2 bg-blue-100'>a styled div</div> and text after")

== Flex Layout

#html("<div class='flex justify-center p-4 bg-gray-100'><div class='p-2 bg-blue-100'>Item 1</div><div class='p-2 bg-red-100'>Item 2</div>item3</div>")

== Headings

#html("<h1 class='text-2xl text-blue-500'>Main Title</h1>")
#html("<h2 class='text-xl text-gray-500'>Subtitle</h2>")
