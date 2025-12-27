#import "../../../colors/colors.typ": *

/**
 * @author: { @Override }
 * @since : 20251226 @ 10:56
 * 
 * IDEA: 
 * 
 * > The Variants are going to define sort of the "Layout of components"
 * These ones in particular are going to be for the cards
 *
**/



// NOTE: for full, because it's going to take up the "full" screen, we want to make sure that
// that we are accounting for the dx/dy - full -> dy = -2.1cm 

#let variants = (
  full: (
    main: (
      pos: "center",
      width: "3xl",
      height: "3xl",
      background-color: cards.full.background,
      dy: -2.1cm,
    ),
    header: (title: none, size: "2xl"),
    content: none,
  ),

  inside: (
    main: (
      pos: "center",
      width: "xl",
      height: "xl",
      background-color: cards.full.background,
      dy: 1cm,
    ),
    content: none,
  )

)
