require_relative 'map'
require_relative 'rover'
require_relative 'view'
require "pry-byebug"

class Controller

  def initialize
    @view = View.new
  end

  def run
    rovers = Array.new
    puts "Welcome to Mars Rover!"
    puts "         --           "

    # Get data
    map = get_map
    2.times do
       rover = rover_initial_position
       instructions = get_instructions
       rover.receives_instructions(instructions)
       rovers << [rover, instructions]
    end
    rovers




  end


  private

  # Returns a Map instance with max_x and max_y
  # All user input and output is controlled by the view
  def get_map
    map = @view.ask_user_for_map_input
    max_x = map.split[0].to_i
    max_y = map.split[1].to_i
    Map.new(max_x, max_y)
  end

  # For each rover a Rover instance is created with position x, y and the correct orientation
  def rover_initial_position
    rover = @view.ask_user_for_rover_position
    x = rover.split[0].to_i
    y = rover.split[1].to_i
    orientation = rover.split[2]
    Rover.new(x, y, orientation)
  end


  def get_instructions
    instructions = @view.ask_user_for_instructions
  end

end


mars_rover = Controller.new
puts mars_rover.run
