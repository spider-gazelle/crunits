require "./unit"

class Units::Measurement < Units::Scale
  def initialize(value : BigDecimal, @unit : Unit)
    @value = value
  end

  def initialize(value : BigDecimal, @unit : Unit)
    @value = BigDecimal.new(value)
  end

  def initialize(value : Number, @unit : Unit)
    @value = BigDecimal.new(value)
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

  def converted_value(other_unit : Unit)
    if other_unit.special?
      other_unit.magnitude scalar
    else
      scalar / other_unit.scalar
    end
  end
end
