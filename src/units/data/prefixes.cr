require "../prefix"

abstract class Units::Prefix
  class Yotta < Prefix
    prop symbol = "Y"
    prop primary_code = "Y"
    prop secondary_code = "YA"
    class_property scalar : BigDecimal = BigDecimal.new("1000000000000000000000000")
  end

  class Zetta < Prefix
    prop symbol = "Z"
    prop primary_code = "Z"
    prop secondary_code = "ZA"
    class_property scalar : BigDecimal = BigDecimal.new("1000000000000000000000")
  end

  class Exa < Prefix
    prop symbol = "E"
    prop primary_code = "E"
    prop secondary_code = "EX"
    class_property scalar : BigDecimal = BigDecimal.new(1000000000000000000)
  end

  class Peta < Prefix
    prop symbol = "P"
    prop primary_code = "P"
    prop secondary_code = "PT"
    class_property scalar : BigDecimal = BigDecimal.new(1000000000000000)
  end

  class Tera < Prefix
    prop symbol = "T"
    prop primary_code = "T"
    prop secondary_code = "TR"
    class_property scalar : BigDecimal = BigDecimal.new(1000000000000)
  end

  class Giga < Prefix
    prop symbol = "G"
    prop primary_code = "G"
    prop secondary_code = "GA"
    class_property scalar : BigDecimal = BigDecimal.new(1000000000)
  end

  class Mega < Prefix
    prop symbol = "M"
    prop primary_code = "M"
    prop secondary_code = "MA"
    class_property scalar : BigDecimal = BigDecimal.new(1000000)
  end

  class Kilo < Prefix
    prop symbol = "k"
    prop primary_code = "k"
    prop secondary_code = "K"
    class_property scalar : BigDecimal = BigDecimal.new(1000)
  end

  class Hecto < Prefix
    prop symbol = "h"
    prop primary_code = "h"
    prop secondary_code = "H"
    class_property scalar : BigDecimal = BigDecimal.new(100)
  end

  class Deka < Prefix
    prop symbol = "da"
    prop primary_code = "da"
    prop secondary_code = "DA"
    class_property scalar : BigDecimal = BigDecimal.new(10)
  end

  # Special case, no prefix
  class None < Prefix
    prop symbol = ""
    prop primary_code = ""
    prop secondary_code = ""
    class_property scalar : BigDecimal = BigDecimal.new(1)
  end

  class Deci < Prefix
    prop symbol = "d"
    prop primary_code = "d"
    prop secondary_code = "D"
    class_property scalar : BigDecimal = BigDecimal.new("0.1")
  end

  class Centi < Prefix
    prop symbol = "c"
    prop primary_code = "c"
    prop secondary_code = "C"
    class_property scalar : BigDecimal = BigDecimal.new("0.01")
  end

  class Milli < Prefix
    prop symbol = "m"
    prop primary_code = "m"
    prop secondary_code = "M"
    class_property scalar : BigDecimal = BigDecimal.new("0.001")
  end

  class Micro < Prefix
    prop symbol = "μ"
    prop primary_code = "u"
    prop secondary_code = "U"
    class_property scalar : BigDecimal = BigDecimal.new("0.000001")
  end

  class Nano < Prefix
    prop symbol = "n"
    prop primary_code = "n"
    prop secondary_code = "N"
    class_property scalar : BigDecimal = BigDecimal.new("0.000000001")
  end

  class Pico < Prefix
    prop symbol = "p"
    prop primary_code = "p"
    prop secondary_code = "P"
    class_property scalar : BigDecimal = BigDecimal.new("0.000000000001")
  end

  class Femto < Prefix
    prop symbol = "f"
    prop primary_code = "f"
    prop secondary_code = "F"
    class_property scalar : BigDecimal = BigDecimal.new("0.000000000000001")
  end

  class Atto < Prefix
    prop symbol = "a"
    prop primary_code = "a"
    prop secondary_code = "A"
    class_property scalar : BigDecimal = BigDecimal.new("0.000000000000000001")
  end

  class Zepto < Prefix
    prop symbol = "z"
    prop primary_code = "z"
    prop secondary_code = "ZO"
    class_property scalar : BigDecimal = BigDecimal.new("0.000000000000000000001")
  end

  class Yocto < Prefix
    prop symbol = "y"
    prop primary_code = "y"
    prop secondary_code = "YO"
    class_property scalar : BigDecimal = BigDecimal.new("0.000000000000000000000001")
  end

  class Kibi < Prefix
    prop symbol = "Ki"
    prop primary_code = "Ki"
    prop secondary_code = "KIB"
    class_property scalar : BigDecimal = BigDecimal.new(1024)
  end

  class Mebi < Prefix
    prop symbol = "Mi"
    prop primary_code = "Mi"
    prop secondary_code = "MIB"
    class_property scalar : BigDecimal = BigDecimal.new(1048576)
  end

  class Gibi < Prefix
    prop symbol = "Gi"
    prop primary_code = "Gi"
    prop secondary_code = "GIB"
    class_property scalar : BigDecimal = BigDecimal.new(1073741824)
  end

  class Tebi < Prefix
    prop symbol = "Ti"
    prop primary_code = "Ti"
    prop secondary_code = "TIB"
    class_property scalar : BigDecimal = BigDecimal.new(1099511627776)
  end
end
