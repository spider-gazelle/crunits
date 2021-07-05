require "./spec_helper"

module Units
  describe ScaleFunction do
    {% begin %}
      {% for func in %w{cel degf degre hpx hpc tan100 ph ld ln lg two_lg} %}
        it "should convert #{ {{func}} } back and forth" do
          number = rand(1000).to_f / 1000.0
          there = ScaleFunction::Functions.to_{{func.id}} number
          back_again = ScaleFunction::Functions.from_{{func.id}} there
          rounded_result = (back_again * 1000).round / 1000.0
          rounded_result.should eq(number)
        end
      {% end %}
    {% end %}
  end
end
