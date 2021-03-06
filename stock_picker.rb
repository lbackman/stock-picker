# frozen_string_literal: true

# Principle: converts array with numbers to an array of differences
# Ex. [17, 3, 6, 9, 15, 8, 6, 1, 10] => [-14, 3, 3, 6, -7, -2, -5, 9]
# Then find the run of digits with the highest sum
# In the above example: 3 + 3 + 6 = 12
# In the shifted array, the starting index is the same but the ending
# index is less by one

def stock_picker(array)
  arr = []
  if strict_decrease?(array)
    "#{arr}, do not buy"
  else
    differences = array_of_diffs(array)
    candidates = get_iterations_array(differences)
    ideal = find_max_sum(candidates)
    arr[0] = ideal[:start_index]
    arr[1] = ideal[:end_index]
    "#{arr}, for a profit of $#{array[arr[1]]} - $#{array[arr[0]]} == $#{ideal[:sum]}"
  end
end

def strict_decrease?(arr)
  arr.each_cons(2).all? { |a, b| (a <=> b) >= 0 }
end

def array_of_diffs(arr)
  diff_arr = []
  arr.each_cons(2) { |a, b| diff_arr << b - a }
  diff_arr
end

def get_iterations_array(arr)
  iterations = []
  (1..arr.length).each do |x|
    arr.each_cons(x).with_index do |a, i|
      hash = Hash.new(0)
      hash[:range] = a
      hash[:start_index] = i
      hash[:end_index] = i + x
      hash[:length] = x
      hash[:sum] = a.sum
      iterations << hash if (hash[:sum]).positive?
    end
  end
  iterations
end

def find_max_sum(arr)
  max_sum = arr.max_by { |hash| hash[:sum] }[:sum]
  max_sum_arr = arr.select { |hash| hash[:sum] == max_sum }
  if max_sum_arr.length >= 2
    find_min_length(max_sum_arr)
  else
    max_sum_arr[0]
  end
end

def find_min_length(arr)
  arr.min_by { |hash| hash[:length] }
end

p 'Enter an array of integers representing stock values for different days'
arr = gets.chomp.split(' ').compact.map(&:to_i)
p "Input array: #{arr}"
p "Best strategy: #{stock_picker(arr)}"
