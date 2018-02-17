module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end


class Grains

  def self.square(square)
    raise ArgumentError, 'Number not valid, numbers valid from 1 to 64' if (square <= 0) || (square > 64)
    grains = 1
    if square == 1
      grains
    else
      (2..square).reduce {|memo| memo *= 2}
    end
  end

  def self.total
   sum = (1..64).to_a
   sum.map! {|n| square(n)}.reduce(:+)
  end

end
