require "./spec_helper"

module Units
  describe Prefix do
    it "enumerates prefix types" do
      Prefix::Yotta.symbol.should eq("Y")
      Prefix.all.includes?(Prefix::Giga).should be_true
      Prefix.find("M").should eq(Prefix::Mega)
      Prefix.find("TR", :secondary_code).should eq(Prefix::Tera)
      Prefix.find("P", :symbol).should eq(Prefix::Peta)
      Prefix.find("deka", :name).should eq(Prefix::Deka)
    end
  end

  describe Atom do
    gram = Atom.find("g").not_nil!
    inch = Atom.find("in", :symbol).not_nil!
    pi = Atom.find("π", :symbol).not_nil!

    it "should enumerate atoms" do
      Atom.all.includes?(gram).should be_true
      Atom.find("g").should eq(gram)
      Atom.find("G", :secondary_code).should eq(gram)
      Atom.find("π", :symbol).should eq(pi)
      Atom.find("gram", :name).should eq(gram)
    end

    it "must flag the properties that define it" do
      gram.base?.should be_true
      gram.derived?.should be_false
      gram.metric?.should be_true

      # pending!("no derived atoms specified yet")
      inch.base?.should be_false
      inch.derived?.should be_true
      inch.metric?.should be_false

      gram.scalar.should eq(1)
      pi.scalar.to_f.should eq(Math::PI)
    end
  end

  describe Measurement do
    meter = Atom.find("m").not_nil!
    m = Measurement.new(1, Unit.new("m"))

    it "should convert meters to centimeters to inches" do
      cm = m.convert_to(Unit.new Term.new(meter, Units::Prefix::Centi))
      cm.value.should eq(100)

      inch = cm.convert_to(Unit.new("in", :symbol))
      inch.value.should eq(BigRational.new(5000, 127))
    end

    it "should be able to check if two units are compatible" do
      inch = Unit.new("in", :symbol)
      inch.dimension.should eq "L"
      m.dimension.should eq "L"

      inch.compatible_with?(m).should be_true
      m.compatible_with?(inch).should be_true

      second = Unit.new("s")
      second.compatible_with?(inch).should be_false
    end
  end

  describe ExpressionParser do
    it "should parse simple expressions" do
      ExpressionParser.parse_expression("m").terms.should eq([Term.new Atom.find("m")])
      ExpressionParser.parse_expression("cm").terms.should eq([Term.new(Atom.find("m"), Prefix::Centi)])
      ExpressionParser.parse_expression("2cm{some with 2 cm thing}").terms.should eq([Term.new(Atom.find("m"), Prefix::Centi, 2, note: "some with 2 cm thing")])
      ExpressionParser.parse_expression("cm4").terms.should eq([Term.new(Atom.find("m"), Prefix::Centi, exponent: 4)])
      ExpressionParser.parse_expression("3cm5{what what}").terms.should eq([Term.new(Atom.find("m"), Prefix::Centi, 3, 5, "what what")])

      m4 = ExpressionParser.parse_expression("m4{with a description}").terms.first
      m4.should eq Term.new(Atom.find("m"), exponent: 4, note: "with a description")
      m4.note.should eq "with a description"
    end

    it "should parse complex expressions" do
      terms = ExpressionParser.parse_expression("kg.s-1").terms
      terms[0].should eq Term.new(Atom.find("g"), Prefix::Kilo)
      terms[1].should eq Term.new(Atom.find("s"), exponent: -1)
    end
  end
end
