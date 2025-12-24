what I want to try



SIZE: sm, md, lg, xl, 2xl, 3xl (the length eventually just represents the height)
VARIANT: default, 

```typst

// making the Card Layout with a dictionary

#let content = (
    ("header", [Hello, world]),
    ("body", [
    fooo
    ]),
    ("footer", [Hi])
)




#card(variant: default, size: "md", ..content)[]
```



