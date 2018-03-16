require_relative 'map'
require_relative 'rover'
require 'pry-byebug'


class Controller

  def self.run
    rovers = Array.new

    # Get map width and height
    map = get_map

    # For each rover, we will ask the user for rover initial position
    # Instructions for the rover
    begin
       rover = rover_initial_position
       instructions = get_instructions
       rover.receives_instructions(instructions)
       rovers << rover if rover
    end while rover


    rovers.each do |rover|
      puts "Rover went out of the plateu!!!" if !rover.inside_plateu?(map.x, map.y)
      puts '%d %d %s' %rover.position
    end
  end


  private

  # Returns a Map instance with x and y
  # All user input and output is controlled by the view
  def self.get_map
    until (input = gets.chomp) && (input =~ /(\d+)\s+(\d+)/)
      return nil if input.empty?
      puts "Invalid input, please introduce the correct input"
    end
    Map.new($1.to_i, $2.to_i)
  end

  # For each rover a Rover instance is created with position x, y and the correct orientation
  def self.rover_initial_position
    until (input = gets.chomp) && (input =~ /(\d+)\s+(\d+)\s+([NESW])/i)
      return nil if input.empty?
      puts "Invalid input, please introduce the correct input"
    end
    rov = Rover.new($1.to_i, $2.to_i, $3.upcase)
  end

  # Ask user for instructions
  def self.get_instructions
    until (input = gets.chomp) && (input =~ /([RLM]+)/i)
      return nil if input.empty?
      puts "Invalid input, please introduce the correct input"
    end
    $1.downcase
  end

end


