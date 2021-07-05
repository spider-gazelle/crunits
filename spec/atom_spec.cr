require "./spec_helper"

module Units
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
end
