class Gigasecond

  GIGASECOND = 10**9

  def self.from(birth)
    birth + GIGASECOND
  end

end

module BookKeeping
  VERSION = 6
end
