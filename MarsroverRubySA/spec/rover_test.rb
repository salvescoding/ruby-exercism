#!/usr/bin/env ruby
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '../lib'))

require 'test/unit'
require 'rover'
require 'map'


class TestRover < Test::Unit::TestCase

  def test_initialization_rover
    rover = Rover.new(1, 2, 'N')
    assert_equal(1, rover.x)
    assert_equal(2, rover.y)
    assert_equal(0, rover.orientation)
  end

  def test_position
    rover = Rover.new(2, 3, 'E')
    assert_equal([2, 3, 'E'], rover.position)
  end

  def test_moves_forward_north
    rover = Rover.new(1, 2, 'N')
    rover.receive_instructions("M")
    assert_equal([1, 3, 'N'], rover.position)
  end

  def test_moves_forward_west
    rover = Rover.new(2, 2, 'W')
    rover.receive_instructions("M")
    assert_equal([1, 2, 'W'], rover.position)
  end

  def test_moves_forward_south
    rover = Rover.new(2, 1, 'S')
    rover.receive_instructions("M")
    assert_equal([2, 0, 'S'], rover.position)
  end

  def test_moves_forward_east
    rover = Rover.new(2, 1, 'E')
    rover.receive_instructions("M")
    assert_equal([3, 1, 'E'], rover.position)
  end


  def test_case_1
    rover = Rover.new(1, 2, 'N')
    rover.receive_instructions("LMLMLMLMM")
    assert_equal([1, 3, 'N'], rover.position)
  end

  def test_case_2
    rover = Rover.new(3 , 3, 'E')
    rover.receive_instructions("MMRMMRMRRM")
    assert_equal([5, 1, 'E'], rover.position)
  end


  def test_rotates_left_from_90_to_360_degrees
    rover = Rover.new(1, 2, 'N')
    rover.receive_instructions("L")
    assert_equal([1, 2, 'W'], rover.position)


    rover = Rover.new(1, 2, 'N')
    rover.receive_instructions("LL")
    assert_equal([1, 2, 'S'], rover.position)



    rover = Rover.new(1, 2, 'N')
    rover.receive_instructions("LLL")
    assert_equal([1, 2, 'E'], rover.position)


    rover = Rover.new(1, 2, 'N')
    rover.receive_instructions("LLLL")
    assert_equal([1, 2, 'N'], rover.position)
  end



  def test_rotate_right_from_90_to_360_degrees
    rover = Rover.new(1, 2, 'E')
    rover.receive_instructions("R")
    assert_equal([1, 2, 'S'], rover.position)


    rover = Rover.new(1, 2, 'E')
    rover.receive_instructions("RR")
    assert_equal([1, 2, 'W'], rover.position)


    rover = Rover.new(1, 2, 'E')
    rover.receive_instructions("RRR")
    assert_equal([1, 2, 'N'], rover.position)


    rover = Rover.new(1, 2, 'E')
    rover.receive_instructions("RRRR")
    assert_equal([1, 2, 'E'], rover.position)
  end




end
