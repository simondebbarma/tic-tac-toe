require_relative './helper.rb'
require_relative './menu.rb'
require_relative './logic.rb'
require_relative './player.rb'

class Game 
    def winner(board)
        if win(board).class == Array
          win_player = win(board)
          win_token = win_player[0]
          board[win_token]
        else
          draw(board)
        end
    end
  
  def game_end(board)
    win(board) || draw(board)
  end

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

  def move(board, index, token = 'X')
    board[index] = token
  end

  
def valid_move(board, index)
    if !index.between?(0, 8)
      puts 'Invalid Move.'
    elsif postion_taken(board, index)
      puts 'Invalid Move.'
    else
      true
    end
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

  def count_move(board)
    counter = 0
    board.each do |b|
      if b == 'X'
        counter += 1
      elsif b == 'O'
        counter += 1
      end
    end
    counter
  end
  
  def postion_taken(board, index)
    if board[index] == '^[1-9]'
      false
    elsif board[index] == 'X'
      true
    elsif board[index] == 'O'
      true
    end
  end
  
  
end