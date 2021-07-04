require "./term"

class Units::Unit
  include Compatible

  def initialize(@terms : Array(Term) = [] of Term)
    @terms << Units::Term.new if @terms.empty?
  end

  def initialize(term : Term)
    @terms = [term]
  end

  def self.new(unit : String, search : Mode = Mode::PrimaryCode)
    ExpressionParser.parse_expression(unit, search)
  end

  getter terms : Array(Term)
  getter expression : String { "todo" }

  getter? special : Bool { terms.size == 1 && terms[0].special? }
  getter depth : Int32 { terms.map(&.depth).max + 1 }
  getter root_terms : Array(Term) { terms.flat_map(&.root_terms) }

  def scalar(magnitude : Number = 1) : BigDecimal
    magnitude = magnitude.is_a?(BigDecimal) ? magnitude : BigDecimal.new(magnitude)
    terms.reduce(BigDecimal.new(1)) do |prod, term|
      prod * term.scalar(magnitude)
    end
  end

  def magnitude(scalar = scalar()) : BigDecimal
    terms.reduce(BigDecimal.new(1)) do |prod, term|
      prod * term.magnitude(scalar)
    end
  end

  def atoms
    terms.map(&.atom)
  end

  def **(other : Number) : Unit
    Unit.new(terms.map(&.**(other)))
  end

  def *(other : Unit | Term | Number)
    operate(:multiply, other)
  end

  def /(other : Unit | Term | Number)
    operate(:divide, other)
  end

  def operate(operator : Operation, other : Unit | Term | Number) : Unit
    exp = operator.divide? ? -1 : 1
    case other
    in Unit
      Unit.new(self.terms + other.terms.map(&.**(exp)))
    in Term
      Unit.new(self.terms.dup << (other ** exp))
    in Number
      Unit.new(self.terms.map &.operate(operator, other).as(Term))
    end
  end
end
