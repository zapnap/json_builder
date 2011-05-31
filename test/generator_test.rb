require 'test_helper'

def generate
  generator = JSONBuilder::Generator.new
  yield generator
  JSON.parse(generator.compile!)
end

context "Generating JSON" do
  test "booleans should be booleans" do
    json = generate do |json|
      json.positive true
      json.negative false
    end
    assert_equal true, json["positive"]
    assert_equal false, json["negative"]
  end

  test "floats should be floats" do
    json = generate { |json| json.float 3.5 }
    assert_equal 3.5, json["float"]
  end

  test "time should be in ISO_8601 format" do
    stamp = Time.at(0).utc
    json = generate { |json| json.time stamp }
    assert_equal json["time"], "1970-01-01T00:00:00+0000"
  end

  test "dates should be in ISO_8601 format" do
    stamp = Date.parse "2011-05-05"
    json = generate { |json| json.date stamp }
    assert_equal json["date"], "2011-05-05T00:00:00+0000"
  end

  test "arrays should be arrays" do
    array = ["string", 2, 3.5, true, false, nil]
    json = generate { |json| json.list array }
    assert_equal json["list"], array
  end

  test "hashes should be objects" do
    hash = { "name" => "David", "age" => 28, "awesome" => true }
    json = generate { |json| json.object hash }
    assert_equal json["object"], hash
  end

  test "unknown values should fall back to to_s" do
    class Custom
      def to_s
        "awesome"
      end
    end

    json = generate { |json| json.custom Custom.new }
    assert_equal "awesome", json["custom"]
  end

  test "should handle arrays" do
    people = [{"name" => "David", "age" => 28}, {"name" => "Hubert", "age" => 34}]

    json = generate do |json|
      json.people do
        json.array! people do
          people.each do |person|
            json.array_item! do
              json.name person["name"]
              json.age person["age"]
            end
          end
        end
      end
    end

    assert_equal people, json["people"]
  end
end
