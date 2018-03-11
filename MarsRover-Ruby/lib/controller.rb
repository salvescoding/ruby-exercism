require_relative 'map'
require_relative 'rover'
require_relative 'view'
require "pry-byebug"

class Controller

  def initialize
    # Create an instance of View, this way you can access the view and his methods
    @view = View.new
  end

  def run
    rovers = Array.new
    puts "Welcome to Mars Rover!"
    puts "         --           "

    # Get all data from user
    map = get_map

    # For each rover, in this case 2, we will ask the user for rover initial position
    # Instructions for the rover
    2.times do
       rover = rover_initial_position
       instructions = get_instructions
       rover.receives_instructions(instructions)
       rovers << rover
    end

    rovers.each do |rover|
      rover.inside_plateu?(map.max_x, map.max_y) ? @view.output_in(rover) : @view.output_out(rover)
    end
  end


  private

  # Returns a Map instance with max_x and max_y
  # All user input and output is controlled by the view
  def get_map
    map = @view.ask_user_for_map_input
    Map.new(map.split[0].to_i, map.split[1].to_i)
  end

  # For each rover a Rover instance is created with position x, y and the correct orientation
  def rover_initial_position
    rover = @view.ask_user_for_rover_position
    Rover.new(rover.split[0].to_i, rover.split[1].to_i, rover.split[2])
  end

  # Ask user for instructions
  def get_instructions
    instructions = @view.ask_user_for_instructions
  end

end


mars_rover = Controller.new
puts mars_rover.run
