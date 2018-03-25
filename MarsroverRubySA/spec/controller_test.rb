$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../lib'))

require 'test/unit'
require 'controller'
require 'rover'
require 'map'

class TestController < Test::Unit::TestCase

  def setup
    @input = ["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM"]
    @map = Map.new(5, 5)
    @controller = Controller.new
  end

  # def test_rovers_position
  #   assert_equal(["1 2 N", "3 3 E", "1 4 N"], @controller.rovers_position)
  # end


end
