require "../atom"

Units::Atom.new(
  "meter",
  "m",
  "m",
  "M",
  "length",
  dimension: "L"
).register

Units::Atom.new(
  "second",
  "s",
  "s",
  "S",
  "time",
  dimension: "T"
).register

Units::Atom.new(
  "gram",
  "g",
  "g",
  "G",
  "mass",
  dimension: "M"
).register

Units::Atom.new(
  "radian",
  "rad",
  "rad",
  "RAD",
  "plane angle",
  dimension: "A"
).register

Units::Atom.new(
  "kelvin",
  "K",
  "K",
  "K",
  "temperature",
  dimension: "C"
).register

Units::Atom.new(
  "coulomb",
  "C",
  "C",
  "C",
  "electric charge",
  dimension: "Q"
).register

Units::Atom.new(
  "candela",
  "cd",
  "cd",
  "CD",
  "luminous intensity",
  dimension: "F"
).register
