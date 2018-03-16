#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../lib'))

require 'test/unit'
require 'rover'
require 'map'

class TestRover < Test::Unit::TestCase

  def test_initialization_map
    map = Map.new(5, 5)
    assert_equal(map.x, 5)
    assert_equal(map.y, 5)
  end

  # Test to start an instance of Rover and that it gets initialized correctly
  def test_initialization_rover
    rover = Rover.new(1, 2, 'N')
    assert_equal(rover.x, 1)
    assert_equal(rover.y, 2)
    assert_equal(rover.orientation, 0)
  end


  # Test if the method position provides the exact position the rover is currently located
  def test_position
    rover = Rover.new(2, 3, 'E')
    assert_equal(rover.position, [2, 3, 'E'])
  end

  #TEST SINGLE MOVEMENTS

  # # Test movement forward when facing north
  def test_moves_forward_north
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("m")
    assert_equal(rover.position, [1, 3, 'N'])
  end
  # # Test movement forward when facing west
  def test_moves_forward_west
    rover = Rover.new(2, 2, 'W')
    rover.receives_instructions("m")
    assert_equal(rover.position, [1, 2, 'W'])
  end
  # # Test movement forward when facing south
  def test_moves_forward_south
    rover = Rover.new(2, 1, 'S')
    rover.receives_instructions("m")
    assert_equal(rover.position, [2, 0, 'S'])
  end
  # # Test movement forward when facing east
  def test_moves_forward_east
    rover = Rover.new(2, 1, 'E')
    rover.receives_instructions("m")
    assert_equal(rover.position, [3, 1, 'E'])
  end

  #TEST MULTIPLE MOVEMENTS

  # Test case 1
  def test_case_1
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("lmlmlmlmm")
    assert_equal(rover.position, [1, 3, 'N'])
  end
  # Test case 2
  def test_case_2
    rover = Rover.new(3 , 3, 'E')
    rover.receives_instructions("mmrmmrmrrm")
    assert_equal(rover.position, [5, 1, 'E'])
  end


  # Test rotate left
  # 90 degrees
  def test_turn_left_90_degrees
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("l")
    assert_equal(rover.position, [1, 2, 'W'])
  end

  #  180 degrees
  def test_turn_left_180_degrees
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("ll")
    assert_equal(rover.position, [1, 2, 'S'])
  end

  #  270 degrees
  def test_turn_left_270_degrees
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("lll")
    assert_equal(rover.position, [1, 2, 'E'])
  end

  # 360 degrees
  def test_turn_left_360_degrees
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("llll")
    assert_equal(rover.position, [1, 2, 'N'])
  end


  # Test rotate right
  #   90 degrees
  def test_turn_right_90_degrees
    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("r")
    assert_equal(rover.position, [1, 2, 'S'])
  end

  # 180 degrees
  def test_turn_right_180_degrees
    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("rr")
    assert_equal(rover.position, [1, 2, 'W'])
  end

  # 270 degrees
  def test_turn_right_270_degrees
    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("rrr")
    assert_equal(rover.position, [1, 2, 'N'])
  end

  # 360 degrees
  def test_turn_right_360_degrees
    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("rrrr")
    assert_equal(rover.position, [1, 2, 'E'])
  end

  # Test if rover exits plateu
  def test_inside_plateu
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("rrmrrmmm")
    assert_equal(rover.inside_plateu?(5, 5), true)
  end

  def test_outside_plateu
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("rrmmmm")
    assert_equal(rover.inside_plateu?(5, 5), false)
  end

end
