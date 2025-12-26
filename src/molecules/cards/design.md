what I want to try




What I want to do is make it feel like we are using a form for the card, but also allow customization 


SIZE: sm, md, lg, xl, 2xl, 3xl (the length eventually just represents the height)
VARIANT: default, 

```typst

#let header = (icon: emoji.money, content: "Hello, World", size: "3xl")
#let pos = (card-pos: "center", text-pos: "center", header-pos: "center")


// The variants are going to depict on how the card will be.

#let variants = (
    default: (),
    research: (),
    split: (),
)

#let card(header: (:), content, variant: "default", width: 100%, positions: (:)) = 


```



mainContent = (
    Width: 100%
    height: "sm" | "md" | "lg" | "xl" | "2xl" | "3xl"
    header: (width: 100%, pos: "center", icon: none, content: "Title", size: "sm" | "md" | "lg" | "xl" | "2xl" | "3xl"),
    body: (width: 100% pos: "center", content: "Body content"),
    footer:(),
)





so the variants, are essentially going to lay


