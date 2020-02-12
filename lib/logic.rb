require 'colorize'
class Logic
  def board_full(board)
    element = board.all? do |el|
      if el == 'X'
        true
      elsif el == 'O'
        true
      end
    end
    element
  end

  def available_slots(board, player_one, player_two)
    slots = []
    board.each do |x|
      slots << x if x.is_a? Integer
    end
    if slots.count.even?
      puts "#{player_two}'s turn".colorize(:yellow)
    else
      puts "#{player_one}'s turn".colorize(:yellow)
    end
    slots.each { |x| print x.to_s + ' ' }
  end

  def valid_move(board, index)
    if !index.between?(0, 8)
      puts 'Invalid Move.'.colorize(:red)
    elsif position_taken(board, index)
      puts 'Invalid Move.'.colorize(:red)
    else
      true
    end
  end

  def position_taken(board, index)
    if board[index] == '^[1-9]'
      false
    elsif board[index] == 'X'
      true
    elsif board[index] == 'O'
      true
    end
  end
end
