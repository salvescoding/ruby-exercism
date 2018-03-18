class Rover

COMPASS = [:N, :E, :S, :W].freeze

  attr_accessor :x, :y, :orientation # allow to read and write on variables

  # Initialize rover instance, and assign the index of "N, E, S or W" to orientation
  def initialize(x, y, orientation)
     @x, @y, @orientation = x, y, COMPASS.find_index(orientation.to_sym)
  end

  # Receives a string of instructions "LMLMLMLMM" and send each instruction to run instruction method
  # as a symbol
  def receives_instructions(instructions)
    instructions.split("").each do |c|
      run_instruction(c.to_sym)
    end
  end

  # Return boolean depending on if rover is inside or outside the plateu
  def inside_plateu?(x, y)
    @x.between?(0, x) && @y.between?(0, y)
  end

  #current position of the rover
  def position
    [ @x, @y, COMPASS[@orientation].to_s ]
  end

  private

  ROTATE = {
    L: :turn_left,
    R: :turn_right
  }.freeze

  MOVE = {
    N: :move_north,
    E: :move_east,
    S: :move_south,
    W: :move_west
  }.freeze

  # Run the instructions and send each instruction
  # to the method that corresponds
  def run_instruction(instruction)
    direction = COMPASS[@orientation]
    instruction == :M ? send(MOVE[direction]) : send(ROTATE[instruction])
  end

  # Moves 1 square North
  def move_north
    @y += 1
  end

  # Moves 1 square East
  def move_east
    @x += 1
  end

  # Moves 1 square South
  def move_south
    @y -= 1
  end

  # Moves 1 square West
  def move_west
    @x -= 1
  end

  # Rover rotate left 90 degrees
  def turn_left
    @orientation == -4 ? @orientation = -1 : @orientation -= 1
  end

  # Rover rotate right 90 degrees
  def turn_right
    @orientation == 3 ? @orientation = 0 : @orientation += 1
  end

end
