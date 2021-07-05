require "./spec_helper"

module Units
  describe Measurement do
    m = Measurement.new(1, "m")

    it "should be able to check if two units are compatible" do
      inch = Unit.new("in", :symbol)
      inch.dimension.should eq "L"
      m.dimension.should eq "L"

      inch.compatible_with?(m).should be_true
      m.compatible_with?(inch).should be_true

      second = Unit.new("s")
      second.compatible_with?(inch).should be_false
    end

    it "should convert between units and allow basic operations" do
      cm = m.convert_to("cm")
      cm.value.should eq(100)

      inch = cm.convert_to("in", :symbol)
      inch.value.should eq(BigRational.new(5000, 127))

      (inch == m).should be_true
      ((inch + m) == (m * 2)).should be_true

      (inch + m + cm).convert_to("m").round(10).value.should eq(3)
      (cm + m + cm).convert_to("m").value.should eq(3)
    end

    it "should work with functional scales" do
      cel = Measurement.new(0, "Cel")
      far = cel.convert_to("[degF]")
      far.value.should eq(32)
      far.convert_to("Cel").value.round(10).should eq 0

      far.to_s.should eq("32 [degF]")
      far.inspect.should eq("#<Units::Measurement value=32 unit=[degF]>")
    end
  end
end
