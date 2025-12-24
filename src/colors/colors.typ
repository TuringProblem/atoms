/**
* @author: { @Override }
* @since: 12/23/2025 @ 01:20 
*/

//: rgb(""),
#let reds = (
  alertRed: rgb("#dc2626"),
  standard: red,
  blood: rgb("#880808"),
  burnt: rgb("#9E2811"),
  sunset: rgb("#96564B"),
  brightRed: rgb("#C72004"),
  neon: rgb("#FF2500"),
)

#let oranges = (
  creamsicle: rgb("#E8922A"),
  light: rgb("#FFB900"),
  neon: rgb("#FF7700"),
)

#let browns = (
  standard: rgb("#4A2B0E"),
  nude: rgb("#997C5F"),
  earth: rgb("#634F3A"),
  terd: rgb("#361D03"),
)

#let greens = (
  alertGreen: rgb("#007a5a"),
  emerald: rgb("#50C878"),
  mint: rgb("#98FB98"),
  cartractor: rgb("#3DED97"),
  neon: rgb("#39FF14"),
  standard: green,
)

#let blues = (
  standard: blue,
  teal: rgb("#08CFCF"),
  darkTeal: rgb("#016969"),
  sky: rgb("#2EC7FF"),
  ocean: rgb("#0E4D63"),
  river: rgb("#0B86B3"),
  neon: rgb("#00F8FF"),
  cartractor: rgb("#82EEFD"),
  frog: rgb("#4D8585"),
)

#let purples = (
  standard: purple,
  neon: rgb("#DD00FF"),
  darkNeon: rgb("#8A029E"),
  dataDog: rgb("#632CA6"),
  soft: rgb("#A33BA3"),
  rose: rgb("#B03191"),
  sunset: rgb("#9C599A"),
)


#let yellows = (
  standard: yellow,
  brightYellow: rgb("#FFEF00"),
  neon: rgb("#EEFF00"),
  terd: rgb("#788008"),
  bee: rgb("#E8CE2A"),
  liberty: rgb("#FFD000"),
)

#let whites = (
  standard: white,
  shade: rgb("#E0DFDE"),
  concrete: rgb("#A8A7A5"),
  late: rgb("#737272"),
)



#let shades = (
  green: (
    lightest: rgb("#FAFFE6"),
    lighter: rgb("#F1FFB8"),
    light: rgb("#E8FF8A"),
    brighter: rgb("#DEFF5C"),
    bright: rgb("#D5FF2E"),
    mid: rgb("#CCFF00"),
    dusk: rgb("#A7D100"),
    dark: rgb("#83A300"),
    darker: rgb("#5E7500"),
    darkest: rgb("#394700"),
  ),

  red: (
    lightest: rgb("#FFE6E6"),
    lighter: rgb("#FFB8B8"),
    light: rgb("#FF8A8A"),
    brighter: rgb("#FF5C5C"),
    bright: rgb("#FF2E2E"),
    mid: rgb("#FF0000"),
    dusk: rgb("#D10000"),
    dark: rgb("#A30000"),
    darker: rgb("#750000"),
    darkest: rgb("#470000"),
  ),

  orange: (
    lightest: rgb("#FFF0E6"),
    lighter: rgb("#FFD4B8"),
    light: rgb("#FFB98A"),
    brighter: rgb("#FF9D5C"),
    bright: rgb("#FF822E"),
    mid: rgb("#FF6600"),
    dusk: rgb("#D15400"),
    dark: rgb("#A34100"),
    darker: rgb("#752F00"),
    darkest: rgb("#471D00"),
  ),

  blue: (
    lightest: rgb("#E6FFFF"),
    lighter: rgb("#B8FFFF"),
    light: rgb("#8AFFFF"),
    brighter: rgb("#5CFFFF"),
    bright: rgb("#33FFFF"),
    mid: rgb("#00FFFF"),
    dusk: rgb("#00D1D1"),
    dark: rgb("#00A3A3"),
    darker: rgb("#007575"),
    darkest: rgb("#004747"),
  ),

  yellow: (
    lightest: rgb("#FFFFE6"),
    lighter: rgb("#FFFFB8"),
    light: rgb("#FFFF8A"),
    brighter: rgb("#FFFF5C"),
    bright: rgb("#FFFF2E"),
    mid: rgb("#FFFF00"),
    dusk: rgb("#D1D100"),
    dark: rgb("#A3A300"),
    darker: rgb("#757500"),
    darkest: rgb("#474700"),
  ),

  purple: (
    lightest: rgb("#FFE6FF"),
    lighter: rgb("#FFB8FF"),
    light: rgb("#FF8AFF"),
    brighter: rgb("#FF5CFF"),
    bright: rgb("#FF2EFF"),
    mid: rgb("#FF00FF"),
    dusk: rgb("#D100D1"),
    dark: rgb("#A300A3"),
    darker: rgb("#750075"),
    darkest: rgb("#470047"),
  ),

  brown: (
    lightest: rgb("#FAF5EB"),
    lighter: rgb("#F1E2C6"),
    light: rgb("#E8D0A1"),
    brighter: rgb("#DEBE7C"),
    bright: rgb("#D5AB58"),
    mid: rgb("#CC9933"),
    dusk: rgb("#A77D2A"),
    dark: rgb("#836221"),
    darker: rgb("#5E4617"),
    darkest: rgb("#392B0E"),
  ),

  leafGreen: (
    lightest: rgb("#EEF6EE"),
    lighter: rgb("#D0E7D0"),
    light: rgb("#B1D8B1"),
    brighter: rgb("#99CC99"),
    bright: rgb("#74B974"),
    mid: rgb("#55AA55"),
    dusk: rgb("#468B46"),
    dark: rgb("#376D37"),
    darker: rgb("#274E27"),
    darkest: rgb("#182F18"),
  ),

  white: (
    lightest: rgb("#FFFFFF"),
    lighter: rgb("#E7E7E7"),
    light: rgb("#CFCFCF"),
    brighter: rgb("#B6B6B6"),
    bright: rgb("#9E9E9E"),
    mid: rgb("#868686"),
    dusk: rgb("#6E6E6E"),
    dark: rgb("#555555"),
    darker: rgb("#3D3D3D"),
    darkest: rgb("#252525"),
  ),

  gray: (
    lightest: rgb("#F9F9F9"),
    border-lightest: rgb("#F4F4F4"),
    lighter: rgb("#E7E7E7"),
    light: rgb("#CFCFCF"),
    brighter: rgb("#B6B6B6"),
    bright: rgb("#9E9E9E"),
    base: rgb("#868686"),
    mid: rgb("#6E6E6E"),
    dark: rgb("#555555"),
    darker: rgb("#3D3D3D"),
    darkest: rgb("#252525"),
  ),
)


// These colors are pallete colors based on core colors above

#let system = (
  green: greens.mint,
  red: reds.neon,
  gray: whites.shade,
  blue: blues.sky,
  purple: purples.dataDog,
)
