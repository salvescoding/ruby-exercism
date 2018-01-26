module BookKeeping
  VERSION = 6
end

class Pangram

  def self.pangram?(phrase)
    alphabet = "a".."z"
    alphabet.to_a
    phrase = phrase.downcase.split("").uniq
    result = alphabet.map { |letter| phrase.include?(letter) }
    !result.include?(false)
  end

end
