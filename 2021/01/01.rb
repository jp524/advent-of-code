def number_increase(array)
  count = 0

  (0...array.length - 1).each do |i|
    count += 1 if array[i + 1] > array[i]
  end

  count
end

def sliding_window_increase(array)
  count = 0

  (0...array.length - 3).each do |i|
    count += 1 if array[i + 1..i + 3].sum > array[i..i + 2].sum
  end

  count
end

def day01
  file = File.open('01/01_input.txt')
  input_string = file.readlines.map(&:chomp)
  input_int = input_string.map(&:to_i)

  p number_increase(input_int)
  p sliding_window_increase(input_int)
end

day01
