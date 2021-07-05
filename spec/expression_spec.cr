require "./spec_helper"

module Units
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

      ExpressionGenerator.new(terms).expression.should eq("kg/s")

      terms = ExpressionParser.parse_expression("kg/s").terms
      terms[0].should eq Term.new(Atom.find("g"), Prefix::Kilo)
      terms[1].should eq Term.new(Atom.find("s"), exponent: -1)

      ExpressionGenerator.new(terms).expression.should eq("kg/s")
    end

    it "should parse and generate expressions correctly" do
      terms = ExpressionParser.parse_expression("mm[Hg].s/ml").terms
      ExpressionGenerator.new(terms).expression.should eq("mm[Hg].s/ml")

      terms = ExpressionParser.parse_expression("kgf/cm2").terms
      ExpressionGenerator.new(terms).expression.should eq("kgf/cm2")

      terms = ExpressionParser.parse_expression("mol/s").terms
      ExpressionGenerator.new(terms).expression.should eq("mol/s")

      terms = ExpressionParser.parse_expression("/m").terms
      ExpressionGenerator.new(terms).expression.should eq("1/m")

      terms = ExpressionParser.parse_expression("/24").terms
      ExpressionGenerator.new(terms).expression.should eq("1/24")

      terms = ExpressionParser.parse_expression("mm/3").terms
      ExpressionGenerator.new(terms).expression.should eq("mm/3")

      terms = ExpressionParser.parse_expression("ml/20").terms
      ExpressionGenerator.new(terms).expression.should eq("ml/20")

      terms = ExpressionParser.parse_expression("mL/min/kg").terms
      ExpressionGenerator.new(terms).expression.should eq("mL/min/kg")

      terms = ExpressionParser.parse_expression("g/9/km").terms
      ExpressionGenerator.new(terms).expression.should eq("g/9/km")

      terms = ExpressionParser.parse_expression("mL/min/kg").terms
      ExpressionGenerator.new(terms).expression.should eq("mL/min/kg")

      terms = ExpressionParser.parse_expression("[pi].rad/360").terms
      ExpressionGenerator.new(terms).expression.should eq("[pi].rad/360")

      terms = ExpressionParser.parse_expression("4.[pi].10*-7.N/A2").terms
      ExpressionGenerator.new(terms).expression.should eq("4.[pi].N/10*7/A2")
    end
  end
end
