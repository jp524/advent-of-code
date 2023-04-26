require_relative './03'

describe 'Day 3 Part 1' do
  it 'takes an input of strings and converts it to a grid of numbers' do
    expect(convert_to_grid(%w[00100 11110 10110])).to eq([[0, 0, 1, 0, 0], [1, 1, 1, 1, 0], [1, 0, 1, 1, 0]])
  end

  it 'returns gamma rate of "10110" with input of %w[00100 11110 10110]' do
    expect(gamma_rate_binary(%w[00100 11110 10110])).to eq('10110')
  end

  it 'returns epsilon rate of "01001" with input of %w[00100 11110 10110]' do
    expect(epsilon_rate_binary('10110')).to eq('01001')
  end

  it 'converts 10110 in binary to 22 in decimal' do
    expect(convert_to_decimal('10110')).to eq(22)
  end
end
