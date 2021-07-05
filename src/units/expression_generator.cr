struct Units::ExpressionGenerator
  def initialize(@terms : Enumerable(Term), @mode : Mode = Mode::PrimaryCode)
    @set = @terms.reduce(Multiset(NamedTuple(f: BigDecimal, p: String?, a: String?)).new) do |s, t|
      identifier = {f: t.factor,
                    p: (t.prefix.to_s(@mode)),
                    a: t.atom.try(&.to_s(@mode))}
      s.add(identifier, t.exponent)
    end
  end

  getter terms, mode
  getter set : Multiset(NamedTuple(f: BigDecimal, p: String?, a: String?))

  def numerator
    set.hash.compact_map do |k, v|
      v <= 0 ? nil : "#{k[:f] if k[:f] != 1}#{k[:p]}#{k[:a]}#{v if v != 1}"
    end.reject(&.empty?).join('.')
  end

  def denominator
    set.hash.compact_map do |k, v|
      v >= 0 ? nil : "#{k[:f] if k[:f] != 1}#{k[:p]}#{k[:a]}#{-v if v != -1}"
    end.reject(&.empty?).join('/')
  end

  def expression
    expression = [] of String
    expression << (numerator.empty? ? "1" : numerator)
    (expression << denominator) unless denominator.empty?
    expression.join('/')
  end
end
