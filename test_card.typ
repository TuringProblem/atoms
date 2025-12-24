#import "src/molecules/cards/card.typ": *

// Test the user's exact example
#let content = (header: [
  hello world
], body: [
hello 

body\


], footer: [hello footer])

#card(variant: "default", size: "md", position: "left", ..content)

#v(1em)

#card(variant: "primary", size: "lg", position: "center", ..content)

#v(1em)

#card(variant: "ghost", size: "xl", position: "right", ..content)

#v(1em)

// Test with just body content (should still work)
#card(variant: "secondary", size: "3xl", position: "center")[Simple body content without header or footer]
