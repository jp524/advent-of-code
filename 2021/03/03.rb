def convert_to_grid(string_input)
  string_input.map do |line|
    line.split(//).map(&:to_i)
  end
end

def most_common_value(array)
  array.max_by { |value| array.count(value) }
end

def opposite_binary(binary_num)
  if binary_num.zero?
    1
  else
    0
  end
end

def convert_to_decimal(binary_array)
  binary_array.join.to_i(2)
end

def multiply_binary_arrays(array1, array2)
  convert_to_decimal(array1) * convert_to_decimal(array2)
end

def power_consumption(grid)
  transposed_grid = grid.transpose

  gamma_array = []
  epsilon_array = []

  transposed_grid.map do |row|
    most_common_binary = most_common_value(row)
    gamma_array << most_common_binary
    epsilon_array << opposite_binary(most_common_binary)
  end

  multiply_binary_arrays(gamma_array, epsilon_array)
end

def day03
  file = File.open('03/03_input.txt')
  input = file.readlines.map(&:chomp)
  p input
  grid = convert_to_grid(input)

  p power_consumption(grid)
end

day03
