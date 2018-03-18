#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../lib'))

require 'test/unit'
require 'rover'
require 'map'


class TestRover < Test::Unit::TestCase

  # Test that start an instance of Map and gets initialized correctly
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

  # Test movement forward when facing north
  def test_moves_forward_north
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("M")
    assert_equal(rover.position, [1, 3, 'N'])
  end
  # # Test movement forward when facing west
  def test_moves_forward_west
    rover = Rover.new(2, 2, 'W')
    rover.receives_instructions("M")
    assert_equal(rover.position, [1, 2, 'W'])
  end
  # # Test movement forward when facing south
  def test_moves_forward_south
    rover = Rover.new(2, 1, 'S')
    rover.receives_instructions("M")
    assert_equal(rover.position, [2, 0, 'S'])
  end
  # # Test movement forward when facing east
  def test_moves_forward_east
    rover = Rover.new(2, 1, 'E')
    rover.receives_instructions("M")
    assert_equal(rover.position, [3, 1, 'E'])
  end

  # #TEST MULTIPLE MOVEMENTS

  # Test case 1 from exercise
  def test_case_1
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("LMLMLMLMM")
    assert_equal(rover.position, [1, 3, 'N'])
  end
  # Test case 2 from exercise
  def test_case_2
    rover = Rover.new(3 , 3, 'E')
    rover.receives_instructions("MMRMMRMRRM")
    assert_equal(rover.position, [5, 1, 'E'])
  end




  # # Test rotate left
  # 90 degrees
  def test_rotates_left_from_90_to_360_degrees
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("L")
    assert_equal(rover.position, [1, 2, 'W'])

  #  180 degrees
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("LL")
    assert_equal(rover.position, [1, 2, 'S'])


  #  270 degrees
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("LLL")
    assert_equal(rover.position, [1, 2, 'E'])

  # 360 degrees
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("LLLL")
    assert_equal(rover.position, [1, 2, 'N'])
  end


  # Test rotate right
  #   90 degrees
  def test_rotate_right_from_90_to_360_degrees
    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("R")
    assert_equal(rover.position, [1, 2, 'S'])

  # 180 degrees
    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("RR")
    assert_equal(rover.position, [1, 2, 'W'])

  # 270 degrees
    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("RRR")
    assert_equal(rover.position, [1, 2, 'N'])

  # 360 degrees
    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("RRRR")
    assert_equal(rover.position, [1, 2, 'E'])
  end

  # Test if rover exits plateu
  def test_inside_plateu?
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("RRMRRMMM")
    assert_equal(rover.inside_plateu?(5, 5), true)

    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("RRMMMM")
    assert_equal(rover.inside_plateu?(5, 5), false)
  end

end
