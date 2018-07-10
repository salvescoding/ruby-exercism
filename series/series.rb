class Series

  def initialize(value)
    @series = value.split("")
  end


  def slices(number_of_slices)
    raise ArgumentError.new("Too many slices") if number_of_slices > @series.length
    (0..@series.length - number_of_slices).map do |i|
      @series[i, number_of_slices].join("")
    end
  end

end
