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
    crash = rovers.select { |r| rover.x.eql?(r.x) && rover.y.eql?(r.y) }
    return false if crash == []
  end

  def rovers_exit_plateu?(rover)
    rover.x.between?(0, self.x) && rover.y.between?(0, self.y)
  end
end
