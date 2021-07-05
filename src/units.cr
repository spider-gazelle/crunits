require "json"
require "math"
require "big"
require "set"

module Units
  enum Mode
    PrimaryCode
    SecondaryCode
    Name
    Symbol
  end

  enum Operation
    Multiply
    Divide
  end

  class ExpressionError < Exception
  end

  class ConversionError < TypeCastError
  end

  class DefinitionError < ArgumentError
  end
end

# a modifier for a base atom
# i.e. centi (centimeter) or mega (megabyte)
require "./units/prefix"

# an abstract list of dimensions that make up a term to check if a conversion is possible
# meters per second compatible with inches per hour
require "./units/compatible"

# base measurement types: meters, grams, seconds etc
# and their derived types (an inch is x meters)
require "./units/atom"

# this combines prefixes and atoms (centimeter)
# and allows for exponents (centimeters squared)
require "./units/term"

# this combines a number of (terms) together
# (centimeters) per (second squared)
require "./units/unit"

# this provides a magnitude to a unit
# 3 (centimeters) per (second squared)
# NOTE:: scale is used by derived atoms to describe how they relate to base atoms
require "./units/scale"

# a scale magnitude that is defined by a function
require "./units/scale_function"

# this inherits from scale and provides the functions to transform from one
# unit to another
require "./units/measurement"

# this parses expressions like `"kg.s-1.(m/s)2"` into a `Unit`
require "./units/expression_parser"

# this generates expressions like `"kg.s-1.(m/s)2"` from a `Unit`
require "./units/expression_generator"

# The data defining the different units
require "./units/data/prefixes"
require "./units/data/base_units"
require "./units/data/derived_units"
