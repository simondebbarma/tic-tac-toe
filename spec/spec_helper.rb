require_relative '../bin/main.rb'

RSpec.configure do |config|
  config.order = :default
end

RSpec::Matchers.define :include_array do |expected|
  match do |actual|
    actual.any? { |array| match_array(expected).matches?(array) }
  end
end
