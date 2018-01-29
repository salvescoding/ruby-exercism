class RomanNumerals

  RN = {
    1000 => "M",
     900 => "CM",
     500 => "D",
     400 => "CD",
     100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
        9 => "IX",
        5 => "V",
        4 => "IV",
        1 => "I",
        0 => "",
  }.freeze

  def to_roman(num)
    RN.map do |value, letter|
      amt, num = num.divmod(value)
      letter * amt
    end.join
  end

end
