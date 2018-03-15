class Bob
  def self.hey(str)
    str = str.strip
    return 'Fine. Be that way!' if str =~ /\A\s*\z/
    return 'Whoa, chill out!'   if str !~ /[a-z]/
    return 'Sure.'              if str =~ /\?\z/
    'Whatever.'
  end
end



module BookKeeping
    VERSION = 1
end
