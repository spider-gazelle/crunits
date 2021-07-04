require "./prefix"
require "./atom"

class Units::Term
  include Compatible

  def initialize(
    @atom = nil,
    prefix = Prefix::None,
    factor : Number = 1,
    exponent : Number = 1,
    @note : String? = nil
  )
    @factor = BigDecimal.new(factor)
    @prefix = prefix.new
    @exponent = exponent.to_i
  end

  @prefix : Prefix
  getter atom : Atom?
  getter factor : BigDecimal
  getter exponent : Int32
  getter note : String? = nil

  getter depth : Int32 do
    atom = @atom
    atom ? atom.depth + 1 : 0
  end

  getter root_terms : Array(Term) do
    if terminal?
      [self]
    else
      atom.not_nil!.scale.not_nil!.root_terms.map do |term|
        self.class.new(term.atom, exponent: term.exponent * exponent)
      end
    end
  end

  def prefix
    @prefix.class
  end

  def special?
    atom = @atom
    atom ? atom.special? : false
  end

  def terminal?
    depth <= 3
  end

  def scalar(magnitude = 1)
    atom = @atom
    calculate(atom ? atom.scalar(magnitude) : magnitude)
  end

  def magnitude(scalar = scalar())
    atom = @atom
    calculate(atom ? atom.magnitude(scalar) : 1)
  end

  private def calculate(value)
    value = value.is_a?(BigDecimal) ? value : BigDecimal.new(value)
    tmp = factor * prefix.scalar * value
    # https://github.com/crystal-lang/crystal/pull/10892
    exponent < 0 ? (tmp.to_big_r ** exponent).to_big_d : tmp ** exponent
  end

  def **(other : Number)
    if other < 0
      Term.new(atom, prefix, factor, exponent.to_f ** other, note)
    else
      Term.new(atom, prefix, factor, exponent ** other, note)
    end
  end

  def *(other : Unit | Term | Number)
    operate(:multiply, other)
  end

  def /(other : Unit | Term | Number)
    operate(:divide, other)
  end

  def operate(operator : Operation, other : Unit | Term) : Unit
    exp = operator.divide? ? -1 : 1
    case other
    in Unit
      Unit.new([self].concat other.terms.map(&.**(exp)))
    in Term
      Unit.new([self, other ** exp])
    end
  end

  def operate(operator : Operation, other : Number) : Term
    new_factor = case operator
                 in .divide?
                   @factor / other
                 in .multiply?
                   @factor * other
                 end
    Term.new(atom, prefix, new_factor, exponent, note)
  end
end
