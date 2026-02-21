#import "css-renderer.typ": html

#set page(margin: 1in)
#set text(font: "New Computer Modern")

= Proper CSS Flex Scoping Test

== Block Layout (no flex)
Normal block layout - justify-center should NOT work here:
#html("<div class='p-4 bg-gray-100 justify-center'>
  <div class='p-2 bg-blue-100'>Block child 1</div>
  <div class='p-2 bg-red-100'>Block child 2</div>
</div>")

== Flex Container with justify-center
Parent has flex, justify-center should center the children:
#html("<div class='flex p-4 bg-gray-100'>
  <div class='p-2 bg-blue-100'>Flex child 1</div>
  <div class='p-2 bg-red-100'>Flex child 2</div>
</div>")

== Flex Column
#html("<div class='flex flex-col justify-center p-4 bg-gray-100'>
  <div class='p-2 bg-blue-100'>Stacked item 1</div>
  <div class='p-2 bg-red-100'>Stacked item 2</div>
</div>")

== Nested Flex Contexts
#html("<div class='flex justify-center p-6 bg-blue-50'>
  <div class='flex flex-col justify-end p-4 bg-red-50'>
    <div class='p-2 bg-green-100'>Nested flex child 1</div>
    <div class='p-2 bg-yellow-100'>Nested flex child 2</div>
  </div>
</div>")

== Complex Real-World Example
#html("
<div class='flex justify-between p-6 bg-gray-50'>
  <div class='flex flex-col p-4 bg-white border rounded'>
    <h3 class='text-lg'>Card Title</h3> <br/>
    <p class='text-sm text-gray-500'>Card description</p>
  </div>
  <div class='flex flex-col p-4 bg-white border rounded'>
    <h3 class='text-lg'>Another Card</h3><br/>
    <p class='text-sm text-gray-500'>More content</p>
  </div>
</div>
<div class=''>sit<div>out</div></div>
")
