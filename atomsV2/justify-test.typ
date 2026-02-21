#import "css-renderer.typ": html

#set page(margin: 1in)
#set text(font: "New Computer Modern")

= Justify Content Test

== justify-start (default)
#html("<div class='flex justify-start p-4 bg-gray-100' style='width: 100%'>
  <div class='p-2 bg-blue-100'>Item 1</div>
  <div class='p-2 bg-red-100'>Item 2</div>
</div>")

== justify-center
#html("<div class='flex justify-center p-4 bg-gray-100'>
  <div class='p-2 bg-blue-100'>Item 1</div>
  <div class='p-2 bg-red-100'>Item 2</div>
</div>")

== justify-end
#html("<div class='flex justify-end p-4 bg-gray-100'>
  <div class='p-2 bg-blue-100'>Item 1</div>
  <div class='p-2 bg-red-100'>Item 2</div>
</div>")

== justify-between
#html("<div class='flex justify-between p-4 bg-gray-100'>
  <div class='p-2 bg-blue-100'>Far Left</div>
  <div class='p-2 bg-red-100'>Far Right</div>
</div>")

== justify-around
#html("<div class='flex justify-around p-4 bg-gray-100'>
  <div class='p-2 bg-blue-100'>Item 1</div>
  <div class='p-2 bg-red-100'>Item 2</div>
  <div class='p-2 bg-green-100'>Item 3</div>
</div>")

== Flex Column with justify-end
#html("<div class='flex flex-col justify-end p-4 bg-gray-100' style='height: 200px'>
  <div class='p-2 bg-blue-100'>Bottom Item 1</div>
  <div class='p-2 bg-red-100'>Bottom Item 2</div>
</div>")