require_relative '../bin/main.rb'

RSpec.configure do |config|
  config.order = :default
end

RSpec::Matchers.define :include_array do |expected|
  match do |actual|
    actual.any? { |array| match_array(expected).matches?(array) }
  end
end

def capture_output
  old_stdout = $stdout
  $stdout = StringIO.new('', 'w')
  yield
  $stdout.string
ensure
  $stdout = old_stdout
end