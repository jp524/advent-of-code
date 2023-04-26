require_relative './03'

describe 'Day 3 Part 1' do
  it 'takes an input of strings and converts it to a grid of numbers' do
    expect(convert_to_grid(%w[00100 11110 10110])).to eq([[0, 0, 1, 0, 0], [1, 1, 1, 1, 0], [1, 0, 1, 1, 0]])
  end

  it 'returns most common value of 1 with input of [1, 1, 1, 0]' do
    expect(most_common_value([1, 1, 1, 0])).to eq(1)
  end

  it 'converts 10110 in binary to 22 in decimal' do
    expect(convert_to_decimal([1, 0, 1, 1, 0])).to eq(22)
  end

  it 'returns 198 when given the example as input' do
    input = %w[
      00100
      11110
      10110
      10111
      10101
      01111
      00111
      11100
      10000
      11001
      00010
      01010
    ]
    grid = convert_to_grid(input)
    expect(power_consumption(grid)).to eq(198)
  end
end
