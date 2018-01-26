module BookKeeping
  VERSION = 4
end

class Squares

  attr_reader :n

  def initialize(num)
    @n = num
  end

  def square_of_sum
    (1..@n).reduce(:+).to_i ** 2
  end

  def sum_of_squares
    [*1..@n].map { |n| n ** 2 }.reduce(:+)
  end

  def difference
    square_of_sum - sum_of_squares
  end

end
