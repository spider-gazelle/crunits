class Units::Multiset(T)
  def initialize
    @hash = Hash(T, Int32).new { |hash, key| hash[key] = 0 }
  end

  def add(key : T, count : Number) : Int32
    count = count.to_i
    current = @hash[key]
    current += count
    if current == 0
      @hash.delete key
    else
      @hash[key] = current
    end
    current
  end

  def multiplicity(key : T) : Int32
    @hash[key]? || 0
  end

  def keys
    @hash.keys
  end

  def ==(other : Multiset)
    same?(other) || @hash == other.@hash
  end

  def same?(other : Multiset)
    @hash.same?(other.@hash)
  end
end
