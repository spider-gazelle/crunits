require "./scale"
require "math"
require "big"

class Units::ScaleFunction < Units::Scale
  def initialize(function_code : String, value, unit = Unit.new)
    super value, unit
    @function = FunctionSelection.parse function_code
  end

  def initialize(@function : FunctionSelection, value, unit = Unit.new)
    super value, unit
  end

  getter function : FunctionSelection

  module Functions
    KELVIN_CELSIUS_DIFF = BigDecimal.new(273.15)

    def to_cel(x)
      # x - 273.15
      BigDecimal.new(x) - KELVIN_CELSIUS_DIFF
    end

    def from_cel(x)
      # x + 273.15
      BigDecimal.new(x) + KELVIN_CELSIUS_DIFF
    end

    KELVIN_FAHRENHEIT_DIFF = BigDecimal.new(459.67)
    FIVE_ZERO              = BigDecimal.new(5.0)
    NINE_ZERO              = BigDecimal.new(9.0)

    def to_degf(x)
      # 9.0 * x / 5.0 - 459.67
      NINE_ZERO * BigDecimal.new(x) / FIVE_ZERO - KELVIN_FAHRENHEIT_DIFF
    end

    def from_degf(x)
      # 5.0 / 9.0 * (x + 459.67)
      FIVE_ZERO / NINE_ZERO * (BigDecimal.new(x) + KELVIN_FAHRENHEIT_DIFF)
    end

    KELVIN_REAUMUR_DIFF = BigDecimal.new(218.52)
    FOUR_ZERO           = BigDecimal.new(4.0)

    def to_degre(x)
      # 4.0 * x / 5.0 - 218.52
      FOUR_ZERO * BigDecimal.new(x) / FIVE_ZERO - KELVIN_REAUMUR_DIFF
    end

    def from_degre(x)
      # 5.0 / 4.0 * (x + 218.52)
      FIVE_ZERO / FOUR_ZERO * (BigDecimal.new(x) + KELVIN_REAUMUR_DIFF)
    end

    def to_hpx(x)
      -Math.log10(x)
    end

    def from_hpx(x)
      # 10.0 ** -x
      # NOTE:: BigDecimal only supports raising by an unsigned integer
      10.0 ** (-x).to_f
    end

    def to_hpc(x)
      -Math.log(x) / Math.log(100.0)
    end

    def from_hpc(x)
      100.0 ** (-x).to_f
    end

    def to_tan100(x)
      100.0 * Math.tan(x)
    end

    def from_tan100(x)
      Math.atan(x / 100.0)
    end

    def to_ph(x)
      to_hpx(x)
    end

    def from_ph(x)
      from_hpx(x)
    end

    def to_ld(x)
      Math.log(x) / Math.log(2.0)
    end

    def from_ld(x)
      2.0 ** x.to_f
    end

    def to_ln(x)
      Math.log(x)
    end

    def from_ln(x)
      Math::E ** x.to_f
    end

    def to_lg(x)
      Math.log10(x)
    end

    def from_lg(x)
      10.0 ** x.to_f
    end

    def to_two_lg(x)
      2.0 * Math.log10(x)
    end

    def from_two_lg(x)
      10.0 ** (x / 2.0).to_f
    end
  end

  include Functions

  {% begin %}
    enum FunctionSelection
      {% names = [] of String %}
      {% for function in Functions.methods %}
        {% names << function.name.id.stringify.gsub(/from_|to_/, "") %}
      {% end %}
      {% names = names.uniq %}
      {% for func in names %}
        {{func.camelcase.id}}
      {% end %}
    end

    # Get the equivalent scalar value of a magnitude on this scale
    def scalar(magnitude = value)
      case @function
      {% for func in names %}
        in .{{func.id}}?
          from_{{func.id}}(magnitude)
      {% end %}
      end
    end

    # Get the equivalent magnitude on this scale for a scalar value
    def magnitude(scalar = scalar)
      case @function
      {% for func in names %}
        in .{{func.id}}?
          to_{{func.id}}(scalar)
      {% end %}
      end
    end
  {% end %}
end
