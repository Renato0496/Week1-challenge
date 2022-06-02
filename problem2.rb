class Array
  def to_histogram
    self.group_by { |a| a }.transform_values { |a| a.size }
  end
end

# Example :
# p [1, 2, 2, 2, 3, 3].to_histogram