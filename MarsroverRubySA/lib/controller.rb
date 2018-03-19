require_relative 'map'
require_relative 'rover'

class Controller

  # Initialize the controller with 4 intance variables that will hold the values from the input file
  def initialize
    @input = []
    @rovers = []
    @instructions = []
    @map = []
  end

  # This method will parse the file and go through every line, and store it on the array input
  def read_file(input)
    File.open(input).each do |row|
      @input << row.chomp
    end
  end

  # Argument error in case there is no coordinates for map
  # calls a method that returns the correct coordinates for map, and instance a new map.
  def create_map
    raise ArgumentError.new("Invalid map coordinates") if get_map_size == []
    map = get_map_size.join("")
    @map = Map.new(map.split(" ")[0].to_i, map.split(" ")[1].to_i)
  end

  # # Argument error in case there is no rovers initial coordinates for rovers
  # calls a method that returns the correct set of initial coordinates for rovers
  def get_rovers_position
    raise ArgumentError.new("Invalid rovers coordinates") if get_rovers_initial_position == []
    rovers = get_rovers_initial_position
    landing_rovers(rovers)
  end

  #  Argument error in case there is instructions for rovers
  # calls a method that returns the correct set of instructions
  def get_instructions
    raise ArgumentError.new("Invalid instructions") if get_rovers_instructions == []
    @instructions = get_rovers_instructions
  end

  # Go through each rover, and for each rover send the instructions that belong to the
  # same index has the rover, rover[0] has instructions[0] and so on
  def move_rovers
    @rovers.each_with_index do |rover, index|
      rover.receives_instructions(@instructions[index])
    end
  end

  # Outputs the final position of the Roverss
  def output
    @rovers.each do |rover|
      puts "Rover went out of the plateu!!!" unless rover.inside_plateu?(@map.x, @map.y)
      puts '%d %d %s' %rover.position
    end
  end


  private

  # It extracts the map x and y values from the input array of strings
  def get_map_size
    @input.select do |line|
      line.match(/[0-9]\s[0-9]$/)
    end
  end

  # It extracts the rovers x, y and orientation values from all rovers
  def get_rovers_initial_position
    @input.select do |line|
      line.match(/[0-9]\s[0-9]\s[NSEW]$/)
    end
  end

  # It extracts the rovers instructions by matching only strings with L M R
  def get_rovers_instructions
    @input.select do |line|
      line.match(/^[LMR]+$/)
    end
  end

  # We create an instance of 1 or more rovers and land them in the plateu with their initial position
  def landing_rovers(rovers)
    rovers.each do |rover|
      @rovers << Rover.new(rover.split(" ")[0].to_i, rover.split(" ")[1].to_i, rover.split(" ")[2].upcase)
    end
  end


end


