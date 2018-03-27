$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../lib'))



require 'test/unit'
require 'map'
require 'rover'

class TestMap < Test::Unit::TestCase

  def setup
    @map = Map.new(5, 5)
    @rover = Rover.new(1, 2, "N")
    @rovers = [Rover.new(2, 3, "W")]
    @map.rovers_initial_position(@rovers)
  end

  def test_rover_inside_plateu
    assert_equal(true, @map.rover_inside_plateu?(@rover))
  end

  def test_rovers_crash_not
    assert_equal(false, @map.rovers_crash?(@rover))
  end

  def test_rovers_crash_yes
    rover = Rover.new(2, 3, "W")
    assert_equal(true, @map.rovers_crash?(rover))
  end

end
