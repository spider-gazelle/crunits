require "../atom"
require "./base_units"

Units::Atom.new(
  "degree Celsius",
  "°C",
  "Cel",
  "CEL",
  "temperature",
  Units::Scale.new(
    :cel,
    1,
    Units::Unit.new("K")
  ),
  special: true,
  classification: "si"
).register
