# Part 1
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

# Part 2
def tally_binaries(array)
  array.tally
end

def num_to_keep(array, rounding_value)
  binary_tally = tally_binaries(array)

  case rounding_value
  when 1
    if binary_tally[0] == binary_tally[1]
      rounding_value
    else
      binary_tally.key(binary_tally.values.max)
    end
  when 0
    if binary_tally[0] == binary_tally[1]
      rounding_value
    else
      binary_tally.key(binary_tally.values.min)
    end
  end
end

def filter_grid_at_column(grid, position_index, num_to_keep)
  grid.select! { |row| row[position_index] == num_to_keep }
  grid
end

def filter_grid_with_param(grid, rounding_value)
  position_index = 0

  grid.length.times do
    return grid.first if grid.length == 1

    transposed_grid = grid.transpose
    column_to_filter = transposed_grid[position_index]

    num_to_keep = num_to_keep(column_to_filter, rounding_value)
    grid = filter_grid_at_column(grid, position_index, num_to_keep)
    position_index += 1
  end
end

def oxygen_generator_array(grid)
  filter_grid_with_param(grid, 1)
end

def co2_scrubber_rating(grid)
  filter_grid_with_param(grid, 0)
end

def life_support_rating(grid)
  multiply_binary_arrays(oxygen_generator_array(Marshal.load(Marshal.dump(grid))), co2_scrubber_rating(Marshal.load(Marshal.dump(grid))))
end

# Common to both parts
def day03
  file = File.open('03/03_input.txt')
  input = file.readlines.map(&:chomp)

  grid = convert_to_grid(input)
  p power_consumption(grid)

  p life_support_rating(grid)
end

day03
