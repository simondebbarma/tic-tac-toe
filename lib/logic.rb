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

  def available_slots(board)
    slots = []
    board.each do |x|
      slots << x if x.is_a? Integer
    end
    if slots.count.even?
      puts 'Player 2\'s turn'
    else
      puts 'Player 1\'s turn'
    end
    slots.each { |x| print x.to_s + ' ' }
  end

  def valid_move(board, index)
    if !index.between?(0, 8)
      puts 'Invalid Move.'
    elsif position_taken(board, index)
      puts 'Invalid Move.'
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
