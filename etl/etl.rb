module BookKeeping
    VERSION = 1 # Where the version number matches the one in the test.
end

class ETL
  def self.transform(old)
    new_dict = {}
    old.each do |key, value|
      value.each {|letter| new_dict[letter.downcase] = key}
    end
    new_dict.sort.to_h
  end
end
