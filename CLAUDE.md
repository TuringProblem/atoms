# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is "Atoms" - a Typst UI library designed for computer science papers, research documents, and brainstorming. It provides reusable components like cards, buttons, and utilities built with the Typst typesetting system.

## Development Commands

### Compilation
- Compile a file: `typst compile <input.typ> [output.pdf]`
- Watch for changes: `typst watch <input.typ> [output.pdf]`
- Example: `typst compile test_card.typ test_card.pdf`

### Common Usage
- Compile main library: `typst compile lib.typ lib.pdf`
- Compile test card: `typst compile test_card.typ test_card.pdf`

## Architecture

### Directory Structure
- `lib.typ` - Main library entry point that imports all components
- `src/` - Source code organized by component type:
  - `molecules/` - Complex UI components (cards, buttons)
  - `util/` - Utility functions and helpers
  - `colors/` - Color system and palettes
- `test_card.typ` - Test/example file demonstrating component usage

### Component System
Components follow a configuration-driven pattern:
- Cards accept `config` dictionaries with styling options (header, padding, radius, border)
- Buttons use `variant` and `size` parameters with predefined style dictionaries
- All components support customization through parameter overrides

### Key Files
- `src/molecules/cards/card.typ` - Main card component
- `src/molecules/buttons/basic.typ` - Button component with variants
- `src/colors/colors.typ` - Comprehensive color system with base colors, shades, and semantic palettes
- `src/util/text-sizes/text-utils.typ` - Text sizing utilities and alignment helpers
- `src/util/ternary/ternary.typ` - Simple ternary operator utility

### Import Pattern
Components import dependencies using relative paths:
```typst
#import "../../colors/colors.typ": *
#import "../../util/text-sizes/text-utils.typ": *
```

### Color System
Extensive color palette with:
- Base colors (reds, blues, greens, etc.) with semantic variants
- Shades system with 10 gradations per color (lightest to darkest)
- System colors for consistent UI theming
- Card-specific color schemes

### Component Configuration
- Cards: Support variants, positioning, headers with icons/text
- Buttons: Multiple variants (default, primary, secondary, ghost, alert, github) and sizes (sm, md, lg)
- Text: Configurable sizes from sm (12pt) to 3xl (40pt)