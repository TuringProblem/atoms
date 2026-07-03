#import "../atoms/join/normal/normal.join.typ": *
#import "../atoms/join/theta/theta.join.typ": *
#import "../atoms/project/project.typ": *
#import "../atoms/select/select.typ": *

// for now because I don't have the langauge, I will make it - we will use this

#let data = (
  (select("something", normalJoin("t1", "t2"), varName: "A")),
  (select("name = 'John'", "A", color: red, varName: "B")),
  ([B $qed$]),
)

#let page(data, width: auto, position: center) ={
  let flat = data.flatten()
  let number = flat.len()

  align(position)[
    #box(inset: 8pt, fill: red, width: width)[
      #for item in flat {
        block(outset: 6pt, fill: white, width: 100%)[#number. #item]
      }
    ]
  ]
}

#page(data, width: 50%, position: left)

ho
