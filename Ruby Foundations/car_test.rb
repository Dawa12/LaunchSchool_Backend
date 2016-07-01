require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test

  def setup
    @car = Car.new # has to be an instnace variable - not a local variable
  end

  def test_car_exists
    assert(@car) # will test if car evaluates to true, telling us that a car object was created
  end

  def test_wheels
    assert_equal(4, @car.wheels)
  end

  def test_name_is_nil
    assert_nil(@car.name) # will confirm that car.name is nil, and hasn't been named yet
  end

  def test_raise_initialize_with_arg # allows us to fail test if specific error gets raised
    assert_raises(ArgumentError) do # this assertion uses a block
      car = Car.new("Joey")
    end
  end

  def test_instance_of_car
    assert_instance_of(Car, @car) # passes if car is an instance of Car class
  end

  def test_includes_car 
    # can really name tests anything that's useful for us, as long as we're starting it with "test"
    arr = [1, 2, 3]
    arr << @car

    assert_includes(arr, @car)
  end
end









