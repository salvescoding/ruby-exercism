class Hamming

  def self.compute(original, mutation)
    unless original.length == mutation.length
      raise ArgumentError
    end

    diff = 0
    mutation_letter = mutation.split('')
    original.each_char.with_index(0) do |char, index|
      if mutation_letter[index] != char.to_s
        diff += 1
      end
    end
    diff
  end
end


module BookKeeping
  VERSION = 3 # Where the version number matches the one in the test.
end
