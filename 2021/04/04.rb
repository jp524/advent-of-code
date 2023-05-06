draw_list, *boards = File.read('04/04_input.txt').split("\n\n")
draw_list = draw_list.split(',').map(&:to_i)

boards = boards.map do |board|
  board.split(' ').map(&:to_i).each_slice(5).to_a
end

def bingo_for_array?(array, drawn)
  return true if (array - drawn).empty?

  false
end

def bingo_for_board?(board, drawn)
  board.each do |row|
    return true if bingo_for_array?(row, drawn)
  end

  board.transpose.each do |column|
    return true if bingo_for_array?(column, drawn)
  end

  false
end

def find_drawn_index_at_win(board, draw_list)
  drawn = draw_list[0, 5]
  (5..draw_list.length).each do |i|
    return i - 1 if bingo_for_board?(board, drawn) == true

    drawn << draw_list[i]
  end
end

def find_drawn_indices_at_win(boards, draw_list)
  drawn_indices_at_win = []
  boards.map do |board|
    drawn_indices_at_win << find_drawn_index_at_win(board, draw_list)
  end

  drawn_indices_at_win
end

def winning_board_and_drawn_array(boards, draw_list, drawn_indices_at_win, strategy)
  case strategy
  when 'first'
    win_index = drawn_indices_at_win.min
  when 'last'
    win_index = drawn_indices_at_win.max
  end
  index_of_board = drawn_indices_at_win.index(win_index)
  winning_board = boards[index_of_board]
  drawn = draw_list[0..win_index]
  [winning_board, drawn]
end

def score(winning_board, drawn)
  flattened_board = winning_board.flatten(2)
  uncalled_numbers = flattened_board - drawn
  uncalled_numbers.sum * drawn.last
end

drawn_indices_at_win = find_drawn_indices_at_win(boards, draw_list)

p 'Part 1'
winning_board, drawn = winning_board_and_drawn_array(boards, draw_list, drawn_indices_at_win, 'first')
p score(winning_board, drawn)

p 'Part 2'
winning_board, drawn = winning_board_and_drawn_array(boards, draw_list, drawn_indices_at_win, 'last')
p score(winning_board, drawn)
