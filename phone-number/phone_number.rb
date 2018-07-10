module BookKeeping
    VERSION = 2
end

class PhoneNumber

  def self.clean(number)
    formatted_number = number.tr('^0-9', '')
    formatted_number[0] = '' if formatted_number[0] == '1'
    return nil if formatted_number[3].match(/[2-9]/).nil? || formatted_number.length != 10
    formatted_number
  end

end
