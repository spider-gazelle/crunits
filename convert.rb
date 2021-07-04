require "yaml"
require "json"

# convert https://github.com/joshwlewis/unitwise data into crystal code

units = YAML.load(File.open "derived_unit.yaml")
output = ""
units.each do |unit|
  scale = unit[:scale]
  scale_string = if scale[:function_code]
    %Q( {
      function_code: #{scale[:function_code].downcase.gsub("2", "two_").to_json},
      value: #{scale[:value].to_s.to_json},
      unit: #{scale[:unit_code].to_json}
    })
  else
    %Q( {
      value: #{scale[:value].to_s.to_json},
      unit: #{scale[:unit_code].to_json}
    })
  end

  output += %Q{
  register(
    name: #{unit[:names].to_json},
    symbol: #{unit[:symbol].to_json},
    primary_code: #{unit[:primary_code].to_json},
    secondary_code: #{unit[:secondary_code].to_json},
    property: #{unit[:property].to_json},
    scale: #{scale_string},
    metric: #{unit[:metric]},
    special: #{unit[:special]},
    arbitrary: #{unit[:arbitrary]},
    classification: #{unit[:classification].to_json}
  )
}
end
File.write "crunit.cr", output
