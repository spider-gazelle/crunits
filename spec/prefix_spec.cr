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
end
