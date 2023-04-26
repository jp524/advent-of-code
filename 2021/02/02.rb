def move_submarine(instructions)
  position = [0, 0]
  # [horizontal, depth]
  instructions.each do |direction, value|
    case direction
    when 'forward'
      position[0] += value.to_i
    when 'down'
      position[1] += value.to_i
    when 'up'
      position[1] -= value.to_i
    end
  end
  position
end

def move_submarine_with_aim(instructions)
  position = [0, 0, 0]
  # [horizontal, depth, aim]
  instructions.each do |direction, value|
    case direction
    when 'forward'
      position[0] += value.to_i
      position[1] += position[2] * value.to_i
    when 'down'
      position[2] += value.to_i
    when 'up'
      position[2] -= value.to_i
    end
  end
  position
end

def day02
  file = File.open('02/02_input.txt')
  input = file.readlines.map(&:chomp)
  instructions = input.map do |line|
    line.split(' ')
  end

  final_position = move_submarine(instructions)
  p final_position.inject(:*)

  final_position_with_aim = move_submarine_with_aim(instructions)
  p final_position_with_aim[0] * final_position_with_aim[1]
end

day02