module BookKeeping
  VERSION = 1
end

class Sieve

  def initialize(number)
    @number = number
  end


  def primes
    expected = (2..@number).to_a
    expected.each do |x|
      ((x*2)..@number).step(x).each{ |y| expected.include?(y) ? expected.delete(y) : next }
    end
  end

end
