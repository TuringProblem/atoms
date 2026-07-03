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

#let problem = "Select something from t1 ^ t2 then from that get john"

#let proofCard(data, problem: "", width: auto, position: center, color: rgb(222, 222, 222)) ={
  let flat = data.flatten()
  let number = 0

  align(position)[
    #box(inset: 8pt, fill: color, width: width, radius: 2pt)[
      #if problem != "" {
        box(inset: 6pt)[
        #text(size: 8pt, fill: white, weight: "bold", top-edge: 2pt, bottom-edge: 2pt)[#problem]
        ]
      }
      #for item in flat {
        number += 1
        block(outset: 6pt, fill: white, width: 100%, radius: 2pt)[#number. #item]
      }
    ]
  ]
}

#proofCard(data, problem: problem, width: 50%, position: center)
