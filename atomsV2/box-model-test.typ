#import "renderer.typ": html

#set page(margin: 1in)
#set text(font: "New Computer Modern")

= CSS Box Model Test

== Basic Box Model
#html("<div class='p-4 m-2 border bg-blue-100'>Content with padding, margin, and border</div>")

== Nested Box Model
#html("<div class='p-6 m-4 border-2 bg-gray-100'><div class='p-3 m-2 border bg-red-100'>Inner box</div></div>")

== Complex Nesting
#html("<div class='p-4 border-blue-200 bg-blue-50'><div class='m-3 p-2 border-red-200 bg-red-50'><div class='p-1 bg-green-100'>Deeply nested</div></div></div>")

== Mixed Box Properties
#html("<div class='mx-4 my-2 px-6 py-3 border-gray-300 rounded-lg bg-gray-50'>Mixed margin/padding with rounded border</div>")

== Visual Box Model Demo
Outer margin → Border → Inner padding → Content

#html("<div class='m-8 border-4 p-8 bg-blue-100'>
  <div class='m-4 border-2 p-4 bg-red-100'>
    <div class='flex justify-center m-2 border p-2 bg-green-100'>
      Nested box model demonstration
    </div>
  </div>
</div>")
