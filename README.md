# Creepy Units

[![CI](https://github.com/spider-gazelle/crunits/actions/workflows/ci.yml/badge.svg)](https://github.com/spider-gazelle/crunits/actions/workflows/ci.yml)

A Crystal lang library for unit measurement conversion and math.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  crunits:
    github: spider-gazelle/crunits
```

## Usage

For an over the top example, consider a car (2800 lb) completing the quarter
mile in 10 seconds (with uniform acceleration).

```crystal

require "units"

distance = Units::Measurement.new(0.25, "mile", :name)   # => #<Units::Measurement value=0.25 unit=[mi_i] (mile)>
time     = Units::Measurement.new(10,   "second", :name) # => #<Units::Measurement value=10 unit=s (second)>
mass     = Units::Measurement.new(2800, "kg", :name)     # => #<Units::Measurement value=2800 unit=kg (kilogram)>

acceleration =  distance * 2 / (time ** 2)
# => #<Units::Measurement value=0.005 unit=[mi_i]/s2 (mile/second2)>

force = (mass * acceleration).convert_to("lbf", :symbol)
# => #<Units::Measurement value=2297.50383668 unit=[lbf_av] (pound force)>

power = (force * distance / time).convert_to("horsepower", :name)
# => #<Units::Measurement value=551.40092080 unit=[HP] (horsepower)>

```

### Comparison

It has the ability to compare measurements with the same or different units.

```crystal
Units::Measurement.new(12, "inch", :name) == Units::Measurement.new(1, "foot", :name)
Units::Measurement.new(1, "meter", :name) > Units::Measurement.new(1, "yard", :name)  # => true
```

Again, you have to compare compatible units. For example, comparing two
temperatures will work, comparing a mass to a length would fail.

### SI abbreviations

You can use shorthand for SI units.

```crystal
Units::Measurement.new(1000, "m") == Units::Measurement.new(1, "km")  # => true
Units::Measurement.new(1, "ml") == Units::Measurement.new(0.001, "l") # => true
```

### Complex Units

Units can be combined to make more complex ones. There is nothing special about
them -- they can still be converted, compared, or operated on.

```crystal
speed = Units::Measurement.new(60, "mile/hour", :name)
# => #<Units::Measurement value=60 unit=[mi_i]/h (mile/hour)>

speed.convert_to("m/s")
# => #<Units::Measurement value=26.8224 unit=m/s (meter/second)>
```

### Math

You can add or subtract compatible measurements.

```crystal
Units::Measurement.new(2.0, "meter", :name) + Units::Measurement.new(3.0, "inch", :name) - Units::Measurement.new(1.0, "yard", :name)
# => #<Units::Measurement value=1.1618 unit=m (meter)>
```

You can multiply or divide measurements and numbers.

```crystal
Units::Measurement.new(110, "volt", :name) * 2
# => #<Units::Measurement value=220 unit=V (volt)>
```

You can multiply or divide measurements with measurements.

```crystal
Units::Measurement.new(20, "mg") / Units::Measurement.new(1, "l")
# => #<Units::Measurement value=20 unit=mg/l (milligram/liter)>
```

Exponentiation is also supported.

```crystal
(Units::Measurement.new(10, "cm") ** 3).convert_to("liter", :name)
# => #<Units::Measurement value=1 unit=l (liter)>
```


## Credits

inspired by [Unitwise Ruby gem](https://github.com/joshwlewis/unitwise)
