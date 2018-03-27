$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../lib'))

require 'test/unit'
require 'controller'

class TestController < Test::Unit::TestCase

  def setup
    @input = ["5 5", "1 2 N", "LMLMLMLMM", "3 3 E", "MMRMMRMRRM", "1 4 N", "MM"]
    @controller = Controller.new
    @controller.receive_input(@input)
  end


  def test_create_map
    assert_equal(5, @controller.create_map.x)
    assert_equal(5, @controller.create_map.y)
  end

  def test_rovers_position
    assert_equal(["1 2 N", "3 3 E", "1 4 N"], @controller.rovers_position)
  end

  def test_rovers_instructions
    assert_equal(["LMLMLMLMM", "MMRMMRMRRM", "MM"], @controller.rovers_instructions)
  end

end
