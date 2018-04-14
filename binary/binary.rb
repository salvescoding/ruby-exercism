module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end

class Binary

  def self.to_decimal(binary)
    raise ArgumentError if !binary.chars.all? {|x| x =~ /[01]/}
    size = binary.size - 1
      result = 0
    binary.split("").each do |b|
      b = b.to_i
      result += (b * (2 ** size))
      size -= 1
    end
    result
  end

end
