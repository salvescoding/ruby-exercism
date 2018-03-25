module BookKeeping
    VERSION = 3 # Where the version number matches the one in the test.
end

class RunLengthEncoding

  def self.encode(input)
    input.gsub(/(\D)\1+/) { |c| "#{c.size}#{c.chr}" }
  end


  def self.decode(input)
    input.gsub(/(\d+)(\D)/) { Regexp.last_match(2) * Regexp.last_match(1).to_i }
  end
end
