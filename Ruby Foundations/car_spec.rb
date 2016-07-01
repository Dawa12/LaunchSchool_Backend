# example of expectation style, as opposed to assertion style of MiniTest. Expectation style is to appease Rspec users, but we'll focus on assertion style

require 'minitest/autorun'

require_relative 'car'

describe 'Car#wheels' do
  it 'has 4 wheels' do
    car = Car.new
    car.wheels.must_equal 4           # this is the expectation
  end
end