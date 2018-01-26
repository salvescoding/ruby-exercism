module BookKeeping
  VERSION = 3
end

CONVERSTIONS = {
  3 => "Pling",
  5 => "Plang",
  7 => "Plong"
}

class Raindrops

  def self.convert(num)
    result = ""
    CONVERSTIONS.each do |n, word|
      result << word if num % n == 0
    end
    result.empty? ? num.to_s : result
  end

end
