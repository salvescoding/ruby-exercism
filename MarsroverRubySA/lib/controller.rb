require_relative 'map'
require_relative 'rover'
require 'pry-byebug'

class Controller

  # Initialize the controller with 4 intance variables that will hold the values from the input file
  def initialize
    @input = []
    @rovers = []
    @instructions
    @map = []
  end

  # This method will parse the file and go through every line, and store it on the array input
  def receive_input(input)
      @input << input
  end


  # Extracts the coordinates from input array since we know the order
  def create_map
    map = @input[0]
    @map = Map.new(map.split(" ")[0].to_i, map.split(" ")[1].to_i)
  end


  # calls a method that returns the correct set of initial coordinates for rovers
  def rovers_position
    rovers_position = @input.values_at(* @input.each_index.select {|i| i.odd?})
    landing_rovers(rovers_position)
  end

  def rovers_instructions
    @instructions = @input.values_at(* @input.each_index.select {|i| i.even?}).slice(1..@input.size)
  end


  # Go through each rover, and for each rover send the instructions that belong to the
  # same index has the rover, rover[0] has instructions[0] and so on
  def move_rovers
    @rovers.each_with_index do |rover, index|
      rover.receive_instructions(@instructions[index])
      puts "Rover number(#{index + 1}) clashed against another Rover" if @map.rovers_crash?(rover)
      puts "Rover number(#{index + 1}) went overboard of the plateu" if !@map.rover_inside_plateu?(rover)
    end
  end

  # Outputs the final position of the Roverss
  def output
    @rovers.each do |rover|
      puts '%d %d %s' %rover.position if @map.rover_inside_plateu?(rover)
    end
  end


  private


  # We create an instance of 1 or more rovers and land them in the plateu with their initial position
  def landing_rovers(rovers)
    rovers.each do |rover|
      @rovers << Rover.new(rover.split(" ")[0].to_i, rover.split(" ")[1].to_i, rover.split(" ")[2].upcase)
    end
    @map.rovers_initial_position(@rovers)
  end


end


