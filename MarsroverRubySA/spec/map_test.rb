$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../lib'))

require 'test/unit'
require 'map'
require 'rover'

class TestMap < Test::Unit::TestCase

  def setup
    @map = Map.new(5, 5)
    @rover = Rover.new(1, 2, "N")
  end

  def test_rover_inside_plateu
    assert_equal(true, @map.rover_inside_plateu?(@rover))
  end

  def test_rovers_crash
    rovers = []
    rovers << Rover.new(2, 3, "W")
    rovers << Rover.new(2, 5, "W")
    assert_equal([], rovers.select { |r| @rover.x.eql?(r.x) && @rover.y.eql?(r.y) })
  end

end
