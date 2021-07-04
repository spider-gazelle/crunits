require "pars"

# NOTE:: we reverse expressions for parsing to deal with optional prefixes as a
# prefix symbol can match an atoms symbol, this way atoms are matched first
module Units::ExpressionParser
  include Pars

  class_getter notation : Pars::Parser(String) do
    not_close = (Parse.char_if(&.!=('{')) * (1..)).map &.join.reverse
    Parse.char('}') >> not_close << Parse.char('{')
  end

  class_getter sign : Pars::Parser(Array(Char)) { Parse.char('-') * (0..1) }
  class_getter digits : Pars::Parser(Array(Char)) { Parse.digit * (1..) }

  class_getter integer : Pars::Parser(Int32) do
    (digits + sign).map &.join.reverse.to_i
  end

  class_getter fixnum : Pars::Parser(Float64) do
    (digits + Parse.char('.') + digits + sign).map &.join.reverse.to_f
  end

  class_getter number : Pars::Parser(Float64 | Int32) { fixnum | integer }

  class_getter prefix_symbol : Pars::Parser(String) do
    Prefix.all.map(&.symbol.reverse).sort! { |a, b| b <=> a }.map { |prefix| Parse.string(prefix) }.reduce { |p1, p2| p1 | p2 }.map &.reverse
  end

  class_getter prefix_primary : Pars::Parser(String) do
    Prefix.all.map(&.symbol.reverse).sort! { |a, b| b <=> a }.map { |prefix| Parse.string(prefix) }.reduce { |p1, p2| p1 | p2 }.map &.reverse
  end

  class_getter prefix_secondary : Pars::Parser(String) do
    Prefix.all.map(&.symbol.reverse).sort! { |a, b| b <=> a }.map { |prefix| Parse.string(prefix) }.reduce { |p1, p2| p1 | p2 }.map &.reverse
  end

  class_getter prefix_name : Pars::Parser(String) do
    Prefix.all.map(&.symbol.reverse).sort! { |a, b| b <=> a }.map { |prefix| Parse.string(prefix) }.reduce { |p1, p2| p1 | p2 }.map &.reverse
  end

  def self.atom(mode : Mode = Mode::PrimaryCode)
    all = Atom.all

    case mode
    in .primary_code?
      all.map(&.primary_code.reverse).sort! { |a, b| b <=> a }.map { |atom| Parse.string(atom) }.reduce { |p1, p2| p1 | p2 }.map &.reverse
    in .secondary_code?
      all.map(&.secondary_code.reverse).sort! { |a, b| b <=> a }.map { |atom| Parse.string(atom) }.reduce { |p1, p2| p1 | p2 }.map &.reverse
    in .symbol?
      all.map(&.symbol.reverse).sort! { |a, b| b <=> a }.map { |atom| Parse.string(atom) }.reduce { |p1, p2| p1 | p2 }.map &.reverse
    in .name?
      all.map(&.name.first.reverse).sort! { |a, b| b <=> a }.map { |atom| Parse.string(atom) }.reduce { |p1, p2| p1 | p2 }.map &.reverse
    end
  end

  def self.parse_term(term : String, mode : Mode) : Term
    atom = atom(mode)
    prefix = case mode
             in .primary_code?
               prefix_primary
             in .secondary_code?
               prefix_secondary
             in .symbol?
               prefix_symbol
             in .name?
               prefix_name
             end
    expression = (notation * (0..1)) &+ (integer * (0..1)) &+ atom &+ (prefix * (0..1)) &+ (integer * (0..1))
    result = expression.parse(term.reverse)
    raise ExpressionError.new("failed to parse term '#{term}' with #{result}") if result.is_a?(Pars::ParseError)
    notes, exponent, atom_string, prefix_arr, factor = result

    prefix_string = prefix_arr.first?
    Term.new(
      Atom.find(atom_string),
      prefix_string ? Prefix.find(prefix_string).not_nil! : Prefix::None,
      factor.first? || 1,
      exponent.first? || 1,
      notes.first?
    )
  end

  def self.parse_expression(expression : String, mode : Mode = Mode::PrimaryCode) : Unit
    # Extract all the terms and the applied operations
    terms = [] of Tuple(String, String)
    loop do
      first_term, operator, remaining = expression.partition(/\.|\//)
      terms << {first_term, operator}
      break if operator.empty?
      expression = remaining
    end

    # Apply the operations to all the terms, generating a unit
    term_string, operator = terms.shift
    unit = Unit.new(parse_term term_string, mode)
    loop do
      break if operator.empty?
      term_string, next_op = terms.shift
      op = case operator
           when "."
             Operation::Multiply
           when "/"
             Operation::Divide
           else
             raise ExpressionError.new("invalid operator #{operator}")
           end
      unit = unit.operate(op, parse_term term_string, mode)
      operator = next_op
    end
    unit
  end
end
