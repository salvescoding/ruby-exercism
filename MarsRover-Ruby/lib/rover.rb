class Rover

COMPASS = [:N, :E, :S, :W].freeze
ACTIONS = {
  m: :move_forward,
  l: :turn_left,
  r: :turn_right
}.freeze

  attr_accessor :x, :y, :orientation

  def initialize(x, y, orientation)
     @x, @y, @orientation = x, y, COMPASS.find_index(orientation.to_sym)
  end


  def receives_instructions(instructions)
    instructions.split("").each do |c|
      run_instructions(c.to_sym)
    end
  end

  def inside_plateu?(x, y)
    @x.between?(0, x) && @y.between?(0, y)
  end

  #current position of the rover
  def position
    [ @x, @y, COMPASS[@orientation].to_s ]
  end

  private


  # Run the instructions and send each instruction
  # to the method that corresponds
  def run_instructions(instruction)
    send(ACTIONS[instruction])
  end

  def move_forward
    case COMPASS[@orientation]
    when :N then @y += 1
    when :E then @x += 1
    when :S then @y -= 1
    when :W then @x -= 1
    end
  end

  def turn_left
    @orientation == -4 ? @orientation = -1 : @orientation -= 1
  end

  def turn_right
    @orientation == COMPASS.size - 1 ? @orientation = 0 : @orientation += 1
  end

end
