class Map
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
    @rovers
  end

  def rovers_initial_position(rovers)
    @rovers = rovers
  end

  def rovers_crash?(rover)
    rovers = @rovers.select {|r| r != rover}
    rovers.select { |r| rover.x.eql?(r.x) && rover.y.eql?(r.y) } == [] ? false : true
  end

  def rover_inside_plateu?(rover)
    rover.x.between?(0, self.x) && rover.y.between?(0, self.y)
  end
end
