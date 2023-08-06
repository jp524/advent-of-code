require_relative './05'

describe 'Day 5 Part 1' do
  context 'Line.horizontal_or_vertical?' do
    it 'returns true when a given line is horizontal' do
      line = Line.new('0,9 -> 5,9')
      expect(line.horizontal_or_vertical?).to eq(true)
    end

    it 'returns true when a given line is vertical' do
      line = Line.new('2,2 -> 2,1')
      expect(line.horizontal_or_vertical?).to eq(true)
    end

    it 'returns false when a given line is neither horizontal nor vertical' do
      line = Line.new('8,0 -> 0,8')
      expect(line.horizontal_or_vertical?).to eq(false)
    end
  end

  context 'Line.generate_points' do
    it 'returns the points that are part of the line' do
      line = Line.new('1,1 -> 1,3')
      expect(line.generate_points).to eq([[1, 1], [1, 2], [1, 3]].reverse)
    end

    it 'returns the points that are part of the line' do
      line = Line.new('9,7 -> 7,7')
      expect(line.generate_points).to eq([[9, 7], [8, 7], [7, 7]].reverse)
    end
  end

  context 'Line.perform' do
    it 'returns the points only if the line is horizontal or vertical' do
      line = Line.new('1,1 -> 1,3')
      expect(line.perform).to eq([[1, 1], [1, 2], [1, 3]].reverse)
    end

    it 'returns nil if the line is neither horizontal nor vertical' do
      line = Line.new('8,0 -> 0,8')
      expect(line.perform).to eq(nil)
    end
  end

  context 'Board.count_overlap' do
    it 'returns 5 when given the sample input' do
      input = <<~TXT
      0,9 -> 5,9
      8,0 -> 0,8
      9,4 -> 3,4
      2,2 -> 2,1
      7,0 -> 7,4
      6,4 -> 2,0
      0,9 -> 2,9
      3,4 -> 1,4
      0,0 -> 8,8
      5,5 -> 8,2
      TXT
      input_lines = input.split("\n")
      board = Board.new(input_lines)
      board.count_points
      expect(board.count_overlap).to eq(5)
    end
  end
end
