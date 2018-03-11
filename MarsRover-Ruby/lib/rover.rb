class Rover

COMPASS = [:N, :E, :S, :W].freeze
ACTIONS = {
  m: :move_forward,
  l: :turn_left,
  r: :turn_right
}.freeze

  attr_reader :x, :y, :orientation

  def initialize(x, y, orientation)
     @x, @y, @orientation = x, y, orientation
  end

  #current position of the rover
  def position
    [ @x, @y, @orientation ]
  end

  def receives_instructions(instructions)
    instructions.split("").each do |c|
      run_instructions(c.to_sym)
    end
  end


  private

  def run_instructions(instruction)
    send(ACTIONS[instruction])
  end

  def move_forward
    case @orientation
    when "N" then @y += 1
    when "E" then @x += 1
    when "S" then @y -= 1
    when "W" then @x -= 1
    end
  end

  def turn_left
    orientation =  COMPASS.find_index(@orientation.to_sym) - 1
    @orientation = COMPASS[orientation]
    binding.pry

  end

  def turn_right
    orientation =  COMPASS.find_index(@orientation.to_sym) + 1
    @orientation = COMPASS[orientation]
  end

end
