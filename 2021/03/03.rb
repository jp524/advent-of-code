def convert_to_grid(string_input)
  string_input.map do |line|
    line.split(//).map(&:to_i)
  end
end

def gamma_rate_binary(string_input)
  grid = convert_to_grid(string_input)
  transposed_grid = grid.transpose

  max_occurances = transposed_grid.map do |column|
    column.max_by { |num| column.count(num) }
  end

  max_occurances.join
end

def epsilon_rate_binary(gamma_rate_binary)
  array = gamma_rate_binary.split(//)

  opposite_array = []
  array.map do |bit|
    opposite_array << if bit == '0'
                        '1'
                      else
                        '0'
                      end
  end
  opposite_array.join
end

def convert_to_decimal(binary)
  binary.to_i(2)
end

def power_consumption(gamma_rate_binary, epsilon_rate_binary)
  convert_to_decimal(gamma_rate_binary) * convert_to_decimal(epsilon_rate_binary)
end

def day03
  file = File.open('03/03_input.txt')
  input = file.readlines.map(&:chomp)

  gamma = gamma_rate_binary(input)
  epsilon = epsilon_rate_binary(gamma)

  p power_consumption(gamma, epsilon)
end

day03
