class Logic

    WIN_POSSIBILITY = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ].freeze
      
  def win(board)
    WIN_POSSIBILITY.each do |win_pos|
      win_pos_one = win_pos[0]
      win_pos_two = win_pos[1]
      win_pos_three = win_pos[2]
  
      pos_one = board[win_pos_one]
      pos_two = board[win_pos_two]
      pos_three = board[win_pos_three]
  
      if pos_one == 'X' && pos_two == 'X' && pos_three == 'X' || pos_one == 'O' && pos_two == 'O' && pos_three == 'O'
        return win_pos
      end
    end
    false
  end
  
  def play(board, player_one = nil, player_two = nil , menu = nil)
    turn(board, menu) until Game.game_end(board)
  
    if winner(board) == 'X'
      puts "#{player_one} is the winner"
    elsif winner(board) == 'O'
      puts "#{player_two} is the winner"
  
    else
      puts 'It a Draw!'
    end
  end
  
  def draw(board)
    if board_full(board)
      win(board).class != Array
    else
      false
    end
  end
  
  def turn(board, menu = nil)
    is_valid_move = false
    until is_valid_move == true
      available_slots(board)
      puts ''
      puts 'Make a move. Select one the above slots.'
      puts ''
      input = gets.chomp
      input = convert_input(input)
      is_valid_move = valid_move(board, input)
      puts ''
      puts '-----------------------------------------'
      puts ''
    end
  
    move(board, input, current_player(board))
    menu.display_board(board)
    puts ''
  end
end