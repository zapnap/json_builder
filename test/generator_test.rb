require 'test_helper'

def generate
  generator = JSONBuilder::Generator.new
  yield generator
  JSON.parse(generator.compile!)
end

context "Generating JSON" do
  test "floats should be floats" do
    json = generate { |json| json.float 3.5 }
    assert_equal 3.5, json["float"]
  end
end