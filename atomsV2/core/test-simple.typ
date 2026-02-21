#import "simple-atoms.typ": atoms

= Simple Atoms Test

== Basic Test
#atoms("<d 'p-4 bg-blue-100' -> {Hello Simple Atoms!}>")

== Abbreviation Test  
#atoms("<d 'flex j-c p-6 bg-gray-100' -> {Centered content}>")

== Chain Test (manual)
#atoms("<d 'p-3 bg-red-100' -> {First div}>")
#atoms("<d 'p-3 bg-red-100' -> {Second div}>")