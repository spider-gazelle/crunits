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
      far.inspect.should eq("#<Units::Measurement value=32 unit=[degF] (degree Fahrenheit)>")
    end

    mph = Measurement.new(60, "[mi_i]/h")
    kmh = Measurement.new(100, "km/h")
    mile = Measurement.new(3, "[mi_i]")
    hpm = Measurement.new(6, "h/[mi_i]")
    cui = Measurement.new(12, "[in_i]3")
    cel = Measurement.new(22, "Cel")
    k = Measurement.new(373.15, "K")
    f = Measurement.new(98.6, "[degF]")
    r = Measurement.new(491.67, "[degR]")

    it "should work with convert_to" do
      mph.convert_to("km/h").value.should eq(96.56064)
      expect_raises(ConversionError) { mph.convert_to("N") }
      cel.convert_to("K").value.should eq 295.15
      k.convert_to("Cel").value.should eq 100
      f.convert_to("Cel").value.round(8).should eq 37
      cel.convert_to("[degR]").value.round(8).should eq(531.27)
      r.convert_to("Cel").value.round(8).should eq(0)
      mph.convert_to(kmh).value.round(8).should eq(96.56064)
    end

    it "must convert to and from another unit without losing precision" do
      circle = Measurement.new(1, "circle", :name)
      circle.convert_to("deg").convert_to("circle", :name).round(30).should eq circle.value

      meter = Measurement.new(10, "m")
      meter.convert_to("[mi_i]").convert_to("m").round(30).should eq meter.value
    end

    describe "#*" do
      it "must multiply by scalars" do
        mult = mph * 4
        mult.value.should eq 240
        mult.unit.should eq Unit.new("[mi_i]/h")
      end

      it "must multiply similar units" do
        mult = mph * kmh
        mult.round(8).should eq 3728.22715342
        mult.unit.should eq Unit.new("[mi_i]/h.[mi_i]/h")
      end

      it "must multiply unsimilar units" do
        mult = mph * mile
        mult.value.should eq 180
        mult.unit.should eq Unit.new("[mi_i]2/h")
      end

      it "must multiply canceling units" do
        mult = mph * hpm
        mult.value.should eq 360
        mult.unit.to_s.should eq "1"
      end
    end

    describe "#/" do
      it "must divide by scalars" do
        div = kmh / 4
        div.value.should eq 25
        div.unit.should eq kmh.unit
      end

      it "must divide by the value of similar units" do
        div = kmh / mph
        div.round(8).should eq 1.03561865
        div.unit.to_s.should eq "1"
      end

      it "must divide dissimilar units" do
        div = mph / hpm
        div.value.should eq 10
        div.unit.to_s.should eq "[mi_i]2/h2"
      end
    end

    describe "#+" do
      it "must add values when units are similar" do
        added = mph + kmh
        added.round(8).should eq 122.13711922
        added.unit.should eq mph.unit
      end

      it "must raise an error when units are not similar" do
        expect_raises(ConversionError) { mph + hpm }
      end
    end

    describe "#-" do
      it "must add values when units are similar" do
        added = mph - kmh
        added.round(8).should eq(-2.13711922)
        added.unit.should eq mph.unit
      end

      it "must raise an error when units are not similar" do
        expect_raises(ConversionError) { mph - hpm }
      end
    end

    describe "#**" do
      it "must raise to a power" do
        exp = mile ** 3
        exp.value.should eq 27
        exp.unit.to_s.should eq "[mi_i]3"
      end

      it "must raise to a negative power" do
        exp = mile ** -3
        exp.round(17).should eq 0.03703703703703704
        exp.unit.to_s.should eq "1/[mi_i]3"
      end
    end

    describe "equality" do
      m = Measurement.new(1, "m")
      mm = Measurement.new(1000, "mm")
      foot = Measurement.new(1, "foot", :name)
      g = Measurement.new(1, "gram", :name)

      it "should be ==" do
        (m == m).should be_true
        (m == mm).should be_true
        (m != foot).should be_true
        (m != g).should be_true
      end

      it "should be ===" do
        (m == m).should be_true
        (m === mm).should be_true
        (m === foot).should be_false
        (m == g).should be_false
      end
    end
  end
end
