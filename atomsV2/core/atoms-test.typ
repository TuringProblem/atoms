#import "atoms-direct.typ": atoms

#set page(margin: 1in)
#set text(font: "New Computer Modern")

= Atoms DSL Test

== Basic Syntax
#atoms("<d 'p-4 bg-blue-100' -> {Hello Atoms!}>")

== Abbreviations
#atoms("<d 'flex j-c p-6 bg-gray-100' -> {Centered with abbreviations}>")

== Content Chaining  
#atoms("<d 'p-3 bg-red-100' -> {First div} -> {Second div}>")

== Nested Elements
#atoms("<d 'flex j-b p-4 bg-gray-50' -> {
  <d 'p-2 bg-blue-100' -> {Left}>
  <d 'p-2 bg-red-100' -> {Right}>
}>")

#let cards = "<d 'p-3 bg-white border r' -> {card 1} -> {card 2} -> {card 3}>"

== Complex Layout
#atoms("<d 'flex f-c j-c p-8 bg-blue-50' -> {
  <h3 't-2xl t-blue' -> {Atoms DSL}>  
  <d 'flex j-a p-4' -> {
    <d 'p-3 bg-white border r' -> {Card 1}>
    <d 'p-3 bg-white border r' -> {Card 2}>
    <d 'p-3 bg-white border r' -> {Card 3}>

    <d 'p-3 bg-white border r' -> {Card 1} -> {Card 2} -> {Card 3}>
  }>
}>")


#atoms(cards)
== Real-World Card Layout
#atoms("<d 'flex j-b p-6 bg-gray-100' -> {
  <d 'flex f-c p-4 bg-white border r-lg' -> {
    <h3 't-lg' -> {Product Title}>
    <p 't-sm t-gray' -> {Product description goes here}>
  } -> {
    <h3 't-lg' -> {Another Product}>
    <p 't-sm t-gray' -> {More details about this item}>
  }>
}>")
