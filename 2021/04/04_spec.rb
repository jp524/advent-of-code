require_relative './04'

describe 'Day 4 Part 1' do
  it 'returns true when array contains all drawn numbers' do
    array = [14, 21, 17, 24, 4]
    drawn = [4, 14, 17, 21, 24]
    expect(bingo_for_array?(array, drawn)).to eq(true)
  end

  it 'returns a true when array contains all drawn numbers' do
    array = [14, 21, 17, 24, 4]
    drawn = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24]
    expect(bingo_for_array?(array, drawn)).to eq(true)
  end

  it 'returns false when array does not contains all drawn numbers' do
    array = [14, 21, 17, 24, 4]
    drawn = [0, 14, 5, 21, 24]
    expect(bingo_for_array?(array, drawn)).to eq(false)
  end

  it 'returns true for winning board' do
    board = [[14, 21, 17, 24, 4],
             [10, 16, 15, 9, 19],
             [18, 8, 23, 26, 20],
             [22, 11, 13, 6, 5],
             [2, 0, 12, 3, 7]]
    drawn = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24]
    expect(bingo_for_board?(board, drawn)).to eq(true)
  end

  it 'returns false for losing board' do
    board = [[14, 21, 17, 24, 4],
             [10, 16, 15, 9, 19],
             [18, 8, 23, 26, 20],
             [22, 11, 13, 6, 5],
             [2, 0, 12, 3, 7]]
    drawn = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 22]
    expect(bingo_for_board?(board, drawn)).to eq(false)
  end

  it 'returns the indices at which each board has won' do
    boards = [[[22, 13, 17, 11, 0],
               [8, 2, 23, 4, 24],
               [21, 9, 14, 16, 7],
               [6, 10, 3, 18, 5],
               [1, 12, 20, 15, 19]],
              [[3, 15, 0, 2, 22],
               [9, 18, 13, 17, 5],
               [19, 8, 7, 25, 23],
               [20, 11, 10, 24, 4],
               [14, 21, 16, 12, 6]],
              [[14, 21, 17, 24, 4],
               [10, 16, 15, 9, 19],
               [18, 8, 23, 26, 20],
               [22, 11, 13, 6, 5],
               [2, 0, 12, 3, 7]]]
    draw_list = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
    expect(find_drawn_indices_at_win(boards, draw_list)).to eq([13, 14, 11])
  end

  it 'returns the winning board and drawn array' do
    boards = [[[22, 13, 17, 11, 0],
               [8, 2, 23, 4, 24],
               [21, 9, 14, 16, 7],
               [6, 10, 3, 18, 5],
               [1, 12, 20, 15, 19]],
              [[3, 15, 0, 2, 22],
               [9, 18, 13, 17, 5],
               [19, 8, 7, 25, 23],
               [20, 11, 10, 24, 4],
               [14, 21, 16, 12, 6]],
              [[14, 21, 17, 24, 4],
               [10, 16, 15, 9, 19],
               [18, 8, 23, 26, 20],
               [22, 11, 13, 6, 5],
               [2, 0, 12, 3, 7]]]
    draw_list = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
    drawn_indices_at_win = [13, 14, 11]
    expect(winning_board_and_drawn_array(boards, draw_list, drawn_indices_at_win, 'first'))
      .to eq([boards[2], draw_list[0..drawn_indices_at_win[2]]])
  end

  it 'returns the correct score' do
    winning_board = [
      [14, 21, 17, 24, 4], [10, 16, 15, 9, 19], [18, 8, 23, 26, 20], [22, 11, 13, 6, 5], [2, 0, 12, 3, 7]
    ]
    drawn = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24]
    expect(score(winning_board, drawn)).to eq(4512)
  end
end

describe 'Day 4 Part 2' do
  it 'returns the winning board and drawn array' do
    boards = [[[22, 13, 17, 11, 0],
               [8, 2, 23, 4, 24],
               [21, 9, 14, 16, 7],
               [6, 10, 3, 18, 5],
               [1, 12, 20, 15, 19]],
              [[3, 15, 0, 2, 22],
               [9, 18, 13, 17, 5],
               [19, 8, 7, 25, 23],
               [20, 11, 10, 24, 4],
               [14, 21, 16, 12, 6]],
              [[14, 21, 17, 24, 4],
               [10, 16, 15, 9, 19],
               [18, 8, 23, 26, 20],
               [22, 11, 13, 6, 5],
               [2, 0, 12, 3, 7]]]
    draw_list = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]
    drawn_indices_at_win = [13, 14, 11]
    expect(winning_board_and_drawn_array(boards, draw_list, drawn_indices_at_win, 'last'))
      .to eq([boards[1], draw_list[0..drawn_indices_at_win[1]]])
  end

  it 'returns the correct score' do
    winning_board = [
      [[3, 15, 0, 2, 22],
       [9, 18, 13, 17, 5],
       [19, 8, 7, 25, 23],
       [20, 11, 10, 24, 4],
       [14, 21, 16, 12, 6]]
    ]
    drawn = [7, 4, 9, 5, 11, 17, 23, 2, 0, 14, 21, 24, 10, 16, 13]
    expect(score(winning_board, drawn)).to eq(1924)
  end
end
