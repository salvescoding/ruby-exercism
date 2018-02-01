class RomanNumerable

NEW_DIVIDERS = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
NEW_CHAR = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]

  def to_roman
    num = self
    roman = ""
    NEW_DIVIDERS.each_with_index do |divider, index|
      t = num / divider
      t.times do
        roman.insert(-1, NEW_CHAR[index])
      end
      num = num % divider
    end
   roman
  end

end
