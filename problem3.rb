require_relative 'problem2' # Required to use to_histogram method

def mean(arr)
  sum = arr.reduce(:+)
  size = arr.size
  return sum.to_f / size if sum % size != 0
  
  sum/size
end

def median(arr)
  arr.sort!
  size = arr.size
  return arr[(size + 1) / 2 - 1] if size.odd?

  double_median = arr[(size / 2) - 1] + arr[size / 2]
  return double_median.to_f / 2 if double_median.odd?

  double_median / 2
end

def mode(arr)
  grouped_nums = arr.to_histogram
  mode = []
  grouped_nums.each { |k, v| mode.push(k) if v == grouped_nums.values.max }
  return mode.first if mode.size == 1

  # In case there are two modes, it will return an array
  mode
end

# p mean([1,2,3,4,5])
# p median([2,1,3,4,6,5])
# p mode([1,2,2,2,2,2,4,5,5,5,5,5])