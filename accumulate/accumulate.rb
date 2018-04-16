
module BookKeeping
   VERSION = 1
end

class Array

  def accumulate
    self.map { |value| yield(value) }
  end

end
