

class Bob

  def self.hey(remark)
    regex = /^[0-9a-zA-Z]*$/
    case remark
    when remark.end_with?("?") then "Sure."
    when remark.upcase then "Whoa, chill out!"
    when regex.match(remark) then "Fine. Be that way!"
    else "Whatever."
    end
  end

end
