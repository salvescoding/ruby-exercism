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


  def test_initialization_rover
    rover = Rover.new(1, 2, 'N')
    assert_equal(rover.x, 1)
    assert_equal(rover.y, 2)
    assert_equal(rover.orientation, 0)
  end



  def test_position
    rover = Rover.new(2, 3, 'E')
    assert_equal(rover.position, [2, 3, 'E'])
  end




  def test_moves_forward_north
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("M")
    assert_equal(rover.position, [1, 3, 'N'])
  end

  def test_moves_forward_west
    rover = Rover.new(2, 2, 'W')
    rover.receives_instructions("M")
    assert_equal(rover.position, [1, 2, 'W'])
  end

  def test_moves_forward_south
    rover = Rover.new(2, 1, 'S')
    rover.receives_instructions("M")
    assert_equal(rover.position, [2, 0, 'S'])
  end

  def test_moves_forward_east
    rover = Rover.new(2, 1, 'E')
    rover.receives_instructions("M")
    assert_equal(rover.position, [3, 1, 'E'])
  end




  def test_case_1
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("LMLMLMLMM")
    assert_equal(rover.position, [1, 3, 'N'])
  end

  def test_case_2
    rover = Rover.new(3 , 3, 'E')
    rover.receives_instructions("MMRMMRMRRM")
    assert_equal(rover.position, [5, 1, 'E'])
  end





  def test_rotates_left_from_90_to_360_degrees
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("L")
    assert_equal(rover.position, [1, 2, 'W'])


    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("LL")
    assert_equal(rover.position, [1, 2, 'S'])



    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("LLL")
    assert_equal(rover.position, [1, 2, 'E'])


    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("LLLL")
    assert_equal(rover.position, [1, 2, 'N'])
  end



  def test_rotate_right_from_90_to_360_degrees
    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("R")
    assert_equal(rover.position, [1, 2, 'S'])


    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("RR")
    assert_equal(rover.position, [1, 2, 'W'])


    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("RRR")
    assert_equal(rover.position, [1, 2, 'N'])


    rover = Rover.new(1, 2, 'E')
    rover.receives_instructions("RRRR")
    assert_equal(rover.position, [1, 2, 'E'])
  end


  def test_inside_plateu?
    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("RRMRRMMM")
    assert_equal(rover.inside_plateu?(5, 5), true)

    rover = Rover.new(1, 2, 'N')
    rover.receives_instructions("RRMMMM")
    assert_equal(rover.inside_plateu?(5, 5), false)
  end

end
