#import "../colors/colors.typ": *
#import "../util/text-sizes/text-utils.typ": *

// Core component system for unified behavior across all Atoms components

#let defaultTheme = (
  colors: (
    primary: shades.blue.mid,
    secondary: shades.gray.light,
    success: shades.green.mid,
    warning: shades.orange.mid,
    danger: shades.red.mid,
    surface: whites.standard,
    background: shades.gray.lightest,
  ),
  spacing: (
    xs: 4pt,
    sm: 8pt,
    md: 12pt,
    lg: 16pt,
    xl: 24pt,
  ),
  radius: (
    sm: 2pt,
    md: 4pt,
    lg: 8pt,
  ),
  typography: (
    body: 10pt,
    caption: 8pt,
    heading: 12pt,
    title: 16pt,
  )
)

// Global theme state (can be overridden)
#let currentTheme = defaultTheme

#let setTheme(theme) = {
  currentTheme = theme
}

// Core component builder - handles variants, sizing, theming
#let buildComponent(
  type: "generic",
  variant: "default",
  size: "md", 
  data: none,
  config: (:),
  variants: (:),
  sizes: (:),
  content
) = {
  
  let theme = currentTheme
  let baseConfig = (
    fill: theme.colors.surface,
    stroke: none,
    radius: theme.radius.md,
    padding: theme.spacing.md,
    text-size: theme.typography.body,
  )
  
  let variantConfig = variants.at(variant, default: (:))
  let sizeConfig = sizes.at(size, default: (:))
  
  let finalConfig = baseConfig + variantConfig + sizeConfig + config
  
  box(
    fill: finalConfig.fill,
    stroke: finalConfig.stroke,
    radius: finalConfig.radius,
    inset: finalConfig.padding,
    width: finalConfig.at("width", default: auto),
  )[
    #text(size: finalConfig.text-size)[
      #content
    ]
  ]
}

// Helper for processing data arrays
#let processData(data, template) = {
  if type(data) == "array" {
    data.map(item => {
      if type(item) == "dictionary" {
        item
      } else {
        (content: item)  
      }
    })
  } else if type(data) == "dictionary" {
    (data,)  
  } else {
    ((content: data),)  
  }
}
