require "./multiset"

module Units::Compatible
  macro included
    include Comparable({{@type}})
  end

  getter composition : Multiset(String) do
    root_terms.reduce(Multiset(String).new) do |set, term|
      atom = term.atom
      set.add(atom.dimension, term.exponent) if atom
      set
    end
  end

  getter composition_string : String do
    set = composition
    set.keys.sort!.join('.') do |key|
      value = set.multiplicity(key)
      value == 1 ? key : "#{key}#{value}"
    end
  end

  def dimension
    composition_string
  end

  def compatible_with?(other)
    composition == other.composition
  end

  def <=>(other)
    if compatible_with?(other)
      scalar <=> other.scalar
    end
  end
end
