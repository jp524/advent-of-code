require_relative './02'

describe 'Day 2 Part 1' do
  it 'returns [5, 5] with [%w[forward 5], %w[down 5]]' do
    expect(move_submarine([%w[forward 5], %w[down 5]])).to eq([5, 5])
  end

  it 'returns [15, 10] with [%w[forward 5], %w[down 5], %w[up 3], %w[down 8], %w[forward 2]]' do
    expect(move_submarine([
                            %w[forward 5],
                            %w[down 5],
                            %w[forward 8],
                            %w[up 3],
                            %w[down 8],
                            %w[forward 2]
                          ])).to eq([15, 10])
  end
end
