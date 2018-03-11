class Rover

COMPASS = [:N, :E, :S, :W].freeze

  attr_accessor :x, :y, :orientation # allow to read and write on variables

  # Initialize rover instance, and assign the index of "N, E, S or W" to orientation
  def initialize(x, y, orientation)
     @x, @y, @orientation = x, y, COMPASS.find_index(orientation.to_sym)
  end


  def receives_instructions(instructions)
    instructions.split("").each do |c|
      run_instructions(c.to_sym)
    end
  end

  # Return boolean depending on if rover is inside the plateu
  def inside_plateu?(x, y)
    @x.between?(0, x) && @y.between?(0, y)
  end

  #current position of the rover
  def position
    [ @x, @y, COMPASS[@orientation].to_s ]
  end

  private

  ACTIONS = {
    m: :move_forward,
    l: :turn_left,
    r: :turn_right
  }.freeze

  # Run the instructions and send each instruction
  # to the method that corresponds
  def run_instructions(instruction)
    send(ACTIONS[instruction])
  end

  # Rover moves forward and updates the x and y coordinates depending
  # where the rover is oriented
  def move_forward
    case COMPASS[@orientation]
    when :N then @y += 1
    when :E then @x += 1
    when :S then @y -= 1
    when :W then @x -= 1
    end
  end

  # Rover turn left 90 degrees, using N E S W as counterclockwise rotation
  def turn_left
    @orientation == -4 ? @orientation = -1 : @orientation -= 1
  end

  # Rover turn right 90 degrees, using N E S W as clockwise rotation
  def turn_right
    @orientation == COMPASS.size - 1 ? @orientation = 0 : @orientation += 1
  end

end
