require "./unit"

class Units::Scale
  include Compatible

  def initialize(@value : BigDecimal, @unit : Unit = Unit.new)
  end

  def initialize(@value : BigDecimal, unit : String, @mode : Mode = Mode::PrimaryCode)
    @unit = Unit.new(unit, @mode)
  end

  def initialize(value : Number | String, @unit : Unit = Unit.new)
    @value = BigDecimal.new(value)
  end

  def initialize(value : Number | String, unit : String, @mode : Mode = Mode::PrimaryCode)
    @value = BigDecimal.new(value)
    @unit = Unit.new(unit, @mode)
  end

  # return a ScaleFunction version of scale
  def self.new(function_code : String | ScaleFunction::FunctionSelection, value : Number | String, unit : Unit = Unit.new)
    Units::ScaleFunction.new(function_code, value, unit)
  end

  def self.new(function_code : String | ScaleFunction::FunctionSelection, value : Number | String, unit : String, search : Mode = Mode::PrimaryCode)
    unit = Unit.new(unit, search)
    Units::ScaleFunction.new(function_code, value, unit)
  end

  getter value : BigDecimal
  getter unit : Unit
  getter depth : Int32 { @unit.depth + 1 }
  getter root_terms : Array(Term) { unit.root_terms }
  getter mode : Mode = Mode::PrimaryCode

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

  def to_s(io, mode : Mode = @mode) : Nil
    unit_string = unit.to_s(mode)
    value.to_s(io)
    if unit_string.presence && unit_string != "1"
      io << ' '
      io << unit_string
    end
  end

  def inspect(io : IO) : Nil
    io << "#<#{self.class} value="
    value.to_s(io)
    io << " unit=#{unit.to_s(:primary_code)} (#{unit.to_s(:name)})>"
  end
end
