
module BookKeeping
  VERSION = 2
end

class SumOfMultiples

  def initialize(*args)
    @args = *args
  end

  def to(range)
    unique = []
    @args.each do |n|
      (1...range).each { |r| unique << r if r % n == 0 }
    end
    unique.uniq.sum
  end


end
