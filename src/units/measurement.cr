require "./unit"

class Units::Measurement < Units::Scale
  def initialize(value : BigDecimal, @unit : Unit)
    @value = value
  end

  def initialize(value : BigDecimal, @unit : Unit)
    @value = BigDecimal.new(value)
  end

  def initialize(value : Number | String, @unit : Unit)
    @value = BigDecimal.new(value)
  end

  def initialize(value : Number | String, unit : String, search : Mode = Mode::PrimaryCode)
    @value = BigDecimal.new(value)
    @unit = Unit.new(unit, search)
  end

  def initialize(value : Measurement, @unit : Unit)
    @value = value.convert_to(@unit).value
  end

  def initialize(value : Measurement, @unit : Unit)
    @value = value.convert_to(@unit).value
  end

  def convert_to(other_unit : Unit)
    if compatible_with?(other_unit)
      Measurement.new(converted_value(other_unit), other_unit)
    else
      raise ConversionError.new("can't convert #{self} to #{other_unit}")
    end
  end

  def convert_to(unit : String, search : Mode = Mode::PrimaryCode)
    convert_to(Unit.new(unit, search))
  end

  def converted_value(other_unit : Unit)
    if other_unit.special?
      other_unit.magnitude scalar
    else
      scalar / other_unit.scalar
    end
  end

  protected def operate_on_value(operator : Operation, other : Number)
    case operator
    in .divide?
      value / other
    in .multiply?
      value * other
    end
  end

  def operate(operator : Operation, other : Number) : Measurement
    Measurement.new(operate_on_value(operator, other), unit)
  end

  def operate(operator : Operation, other : Measurement) : Measurement
    other = other.convert_to(unit) if compatible_with?(other)
    Measurement.new(operate_on_value(operator, other.value), unit.operate(operator, other.unit))
  end

  def *(other : Measurement | Number)
    operate(:multiply, other)
  end

  def /(other : Measurement | Number)
    operate(:divide, other)
  end

  def **(other : Number)
    Measurement.new(value ** other, unit ** other)
  end

  def +(other : Measurement)
    combine(true, other)
  end

  def -(other : Measurement)
    combine(false, other)
  end

  def ceil
    Measurement.new(value.ceil, unit)
  end

  def floor
    Measurement.new(value.floor, unit)
  end

  def ==(other : Measurement)
    return true if same?(other)
    if compatible_with?(other)
      @value == other.convert_to(unit).value
    else
      false
    end
  end

  protected def combine(add : Bool, other : Measurement) : Measurement
    if compatible_with?(other)
      other_value = other.convert_to(unit).value
      if add
        Measurement.new(value + other_value, unit)
      else
        Measurement.new(value - other_value, unit)
      end
    else
      raise ConversionError.new "unable to combine #{other} with #{self}"
    end
  end

  delegate to_big_d, to_big_f, to_big_i, to_big_r, to_f, to_f!, to: @value
  delegate to_f32, to_f32!, to_f64, to_f64!, to_i, to_i!, to: @value
  delegate to_i16, to_i16!, to_i32, to_i32!, to_i64, to_i64!, to: @value
  delegate to_i8, to_i8!, to_u, to_u!, to_u16, to_u16!, to: @value
  delegate to_u32, to_u32!, to_u64, to_u64!, to_u8, to_u8!, to: @value
  delegate round, sign, significant, zero?, humanize, format, divmod, abs, abs2, to: @value
end
