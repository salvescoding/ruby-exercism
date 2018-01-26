class Complement

  DNA_PAIRINGS = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  def self.of_dna(argument)
    argument.split('').map { |c| !DNA_PAIRINGS.has_key?(c) ? "" : DNA_PAIRINGS.values_at(c) }.join('')
  end


end

module BookKeeping
  VERSION = 4
end
