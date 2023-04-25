def number_increase(array)
  count = 0

  (0...array.length - 1).each do |i|
    count += 1 if array[i + 1] > array[i]
    count
  end

  count
end

def day_01
  file = File.open('01_input.txt')
  input_string = file.readlines.map(&:chomp)
  input_int = input_string.map(&:to_i)

  p number_increase(input_int)
end

day_01
