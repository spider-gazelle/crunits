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
      all.compact_map(&.symbol.try(&.reverse)).sort! { |a, b| b <=> a }.map { |atom| Parse.string(atom) }.reduce { |p1, p2| p1 | p2 }.map &.reverse
    in .name?
      all.map(&.name.first.reverse).sort! { |a, b| b <=> a }.map { |atom| Parse.string(atom) }.reduce { |p1, p2| p1 | p2 }.map &.reverse
    end
  end

  # ameba:disable Metrics/CyclomaticComplexity
  def self.parse_term(term : String, mode : Mode, op : Operation) : Term
    # as `/m` is a valid unit string
    return Term.new(exponent: op.divide? ? -1 : 1) if term.empty?
    rev_term = term.reverse

    # terms can be an number all on their own
    check_number = number &+ ((Parse.char_if { true }) * (0..1))
    number_result = check_number.parse(rev_term)
    if !number_result.is_a?(Pars::ParseError)
      if number_result[1].first?.nil?
        return Term.new(factor: number_result[0], exponent: op.divide? ? -1 : 1)
      end
    end

    # Search for the atom
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
    result = expression.parse(rev_term)
    raise ExpressionError.new("failed to parse term '#{term}' with #{result}") if result.is_a?(Pars::ParseError)
    notes, exponent, atom_string, prefix_arr, factor = result

    # NOTE:: This fails to handle things like `kg/s-1` (not sure if this is really required)
    exponent_value = exponent.first? || 1
    exponent_value = -exponent_value if op.divide? && exponent_value > 0

    prefix_string = prefix_arr.first?
    Term.new(
      Atom.find(atom_string, mode),
      prefix_string ? Prefix.find(prefix_string).not_nil! : Prefix::None,
      factor.first? || 1,
      exponent_value,
      notes.first?
    )
  end

  def self.parse_expression(expression : String, mode : Mode = Mode::PrimaryCode) : Unit
    # Extract all the terms and the applied operations
    terms = [] of Tuple(String, String)
    processing = expression
    loop do
      first_term, operator, remaining = processing.partition(/\.|\//)
      terms << {first_term, operator}
      break if operator.empty?
      processing = remaining
    end

    # Apply the operations to all the terms, generating a unit
    term_string, operator = terms.shift
    parsed_terms = [parse_term(term_string, mode, Operation::Multiply)]
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
      parsed_terms << parse_term(term_string, mode, op)
      operator = next_op
    end
    Unit.new(parsed_terms)
  rescue error
    raise ExpressionError.new("expression parsing failed for expression: '#{expression}', term: #{term_string}, op: #{operator}, mode: #{mode}", cause: error)
  end
end
