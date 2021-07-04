abstract class Units::Prefix
  def self.all
    {{ @type.all_subclasses }}
  end

  def self.find(string : String, method : Mode = Mode::PrimaryCode)
    case method
    in .primary_code?
      all.find(&.primary_code.==(string))
    in .secondary_code?
      all.find(&.secondary_code.==(string))
    in .symbol?
      all.find(&.symbol.==(string))
    in .name?
      all.find(&.name.==(string))
    end
  end

  macro prop(name)
    class_getter {{name.target}} : String = {{name.value}}
  end

  macro inherited
    prop name = {{@type.name.split("::")[-1].downcase}}
  end
end

require "./data/prefixes"
