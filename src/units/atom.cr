class Units::Atom
  include Compatible

  class_getter all : Set(Atom) = Set(Atom).new

  def self.find(string : String, method : Mode = Mode::PrimaryCode)
    case method
    in .primary_code?
      all.find(&.primary_code.==(string))
    in .secondary_code?
      all.find(&.secondary_code.==(string))
    in .symbol?
      all.find(&.symbol.==(string))
    in .name?
      all.find(&.name.includes?(string))
    end
  end

  def self.register(atom : Atom)
    @@all << atom
    atom
  end

  def initialize(
    name : String | Array(String),
    @symbol,
    @primary_code,
    @secondary_code,
    @property,
    @scale = nil,
    @metric = true,
    @special = false,
    @arbitrary = false,
    @dimension = nil,
    @classification = nil
  )
    @name = name.is_a?(String) ? [name] : name
  end

  def register
    self.class.register self
  end

  @dimension : String?
  @classification : String?

  getter name : Array(String)
  getter symbol : String
  getter primary_code : String
  getter secondary_code : String
  getter property : String
  getter! scale : Scale
  getter? metric : Bool
  getter? special : Bool
  getter? arbitrary : Bool

  getter depth : Int32 { base? ? 0 : scale.depth + 1 }
  getter root_terms : Array(Term) { base? ? [Term.new(self)] : scale.root_terms }

  def base?
    !!(@dimension && !@scale)
  end

  def derived?
    !base?
  end

  def terminal?
    depth <= 3
  end

  def dimension
    terminal? ? @dimension || property : composition_string
  end

  # Get a numeric value that can be used to with other atoms to compare with
  # or operate on. Base units have a scalar of 1.
  def scalar(magnitude = 1)
    base? ? BigDecimal.new(magnitude) : scale.scalar(magnitude)
  end

  def magnitude(scalar = nil)
    special? ? scale.magnitude(scalar) : 1
  end
end

require "./data/base_units"

Units::Atom.new(
  "inch",
  "in",
  "[in_i]",
  "[IN_I]",
  "length",
  Units::Scale.new(
    2.54,
    Units::Unit.new(Units::Term.new(Units::Atom.find("m"), Units::Prefix::Centi))
  ),
  metric: false
).register

Units::Atom.new(
  "the number pi",
  "π",
  "[pi]",
  "[pi]",
  "number",
  Units::Scale.new(
    BigDecimal.new("3.141592653589793238462643383279502884197169399375105820974944592307816406286208998628034825"),
    Units::Unit.new
  ),
  metric: false
).register
