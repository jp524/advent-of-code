input = File.read('05/05_input.txt')
input_lines = input.split("\n")

class Line
  def initialize(line)
    match = line.match(/(\d+),(\d+)\s->\s(\d+),(\d+)/)
    @start = [match[1].to_i, match[2].to_i]
    @finish = [match[3].to_i, match[4].to_i]
  end

  def horizontal_or_vertical?
    return true if @start[0] == @finish[0] || @start[1] == @finish[1]

    false
  end

  def generate_points
    points = []
    diff_x = @finish[0] - @start[0]
    diff_y = @finish[1] - @start[1]

    until diff_x.zero? && diff_y.zero?
      points << [@start[0] + diff_x, @start[1] + diff_y]
      if diff_x.positive?
        diff_x -= 1
      elsif diff_x.negative?
        diff_x += 1
      elsif diff_y.positive?
        diff_y -= 1
      elsif diff_y.negative?
        diff_y += 1
      end
    end
    points << @start
  end

  def perform
    return unless horizontal_or_vertical?

    generate_points
  end
end

class Board
  attr_reader :lines, :points

  def initialize(input_lines)
    @lines = input_lines.map { |line| Line.new(line) }
    @points = []
  end

  def count_points
    @lines.map do |line|
      @points += line.perform if line.perform
    end
  end

  def count_overlap
    ordered = @points.tally.sort_by { |_k, v| -v }
    ordered.select { |item| item[1] >= 2 }.count
  end
end

# Part 1
board = Board.new(input_lines)
board.count_points
p board.count_overlap
