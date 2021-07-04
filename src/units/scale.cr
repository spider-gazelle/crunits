require "./unit"

class Units::Scale
  include Compatible

  def initialize(value : BigDecimal, @unit : Unit = Unit.new)
    @value = value
  end

  def initialize(value : BigDecimal, @unit : Unit = Unit.new)
    @value = BigDecimal.new(value)
  end

  def initialize(value : Number, @unit : Unit = Unit.new)
    @value = BigDecimal.new(value)
  end

  # return a ScaleFunction version of scale
  def self.new(function_code : String | ScaleFunction::FunctionSelection, value, unit = Unit.new)
    Units::ScaleFunction.new(function_code, value, unit)
  end

  getter value : BigDecimal
  getter unit : Unit
  getter depth : Int32 { @unit.depth + 1 }
  getter root_terms : Array(Term) { unit.root_terms }

  delegate atoms, terms, special?, to: @unit

  def scalar(magnitude = value)
    if special?
      unit.scalar(magnitude)
    else
      value * unit.scalar
    end
  end

  def magnitude(scalar = scalar())
    if special?
      unit.magnitude(scalar)
    else
      value * unit.magnitude
    end
  end
end
