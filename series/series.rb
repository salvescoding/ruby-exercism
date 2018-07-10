class Series

  def initialize(value)
    @series = value.split("")
  end


  def slices(number_of_slices)
    return @series if number_of_slices == 1
    return raise ArgumentError.new("Too many slices") if number_of_slices > @series.size
    result = []
    @series.each_with_index do |element, index|
      limit_index = index + (number_of_slices - 1)
      if !@series[limit_index].nil?
        element << @series[index + 1..(index + (number_of_slices - 1))].join("")
        result << element
      end
    end
    result
  end

end
