class Array
  def keep
    empty_array = []
    self.each {|i| empty_array << i if yield(i) }
    empty_array
  end

  def discard
    empty_array = []
    self.each {|i| empty_array << i if yield(i) == false }
    empty_array
  end
end
