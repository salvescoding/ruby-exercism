class Array
  def keep(&block)
    self.select { |i| block.call(i) }
  end

  def discard(&block)
    self.reject {|i| block.call(i) }
  end
end
