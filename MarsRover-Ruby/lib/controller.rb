require_relative 'map'
require_relative 'rover'
require 'pry-byebug'

class Controller

  def initialize
    @input = []
    @rovers = []
    @instructions = []
    @map = []
  end

  def read_file(input)
    File.open(input).each do |row|
      @input << row.chomp
    end
  end

  def create_map
    raise ArgumentError.new("Invalid map coordinates") if get_map_size == ''
    map = get_map_size.join("")
    @map = Map.new(map.split(" ")[0].to_i, map.split(" ")[1].to_i)
  end

  def create_rovers
    raise ArgumentError.new("Invalid rovers coordinates") if get_rovers_initial_position == []
    rovers = get_rovers_initial_position
    landing(rovers)
  end

  def get_instructions
    raise ArgumentError.new("Invalid instructions") if get_rover_instructions == []
    @instructions = get_rover_instructions
  end

  def move_rovers
    @rovers.each_with_index do |rover, index|
      rover.receives_instructions(@instructions[index])
    end
  end

  def output
    @rovers.each do |rover|
      puts "Rover went out of the plateu!!!" unless rover.inside_plateu?(@map.x, @map.y)
      puts '%d %d %s' %rover.position
    end
  end


  private

  # It finds inside the txt file we parse the values to set the map
  def get_map_size
    @input.select do |line|
      line.match(/[0-9]\s[0-9]$/)
    end
  end

  def get_rovers_initial_position
    @input.select do |line|
      line.match(/[0-9]\s[0-9]\s[NSEW]$/)
    end
  end

  def get_rover_instructions
    @input.select do |line|
      line.match(/^[LMR]+$/)
    end
  end

  def landing(rovers)
    rovers.each do |rover|
      @rovers << Rover.new(rover.split(" ")[0].to_i, rover.split(" ")[1].to_i, rover.split(" ")[2].upcase)
    end
  end


end


