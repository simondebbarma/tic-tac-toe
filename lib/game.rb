require_relative './input_validator_helper.rb'
require_relative './logic.rb'

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

class Game
  attr_reader :win_posibily

  def initialize(win_posibily = WIN_POSSIBILITY)
    @win_posibily = win_posibily
  end

  def logic
    @logic = Logic.new
  end

  def win(board)
    win_posibily.each do |win_pos|
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

  def draw(board)
    if logic.board_full(board)
      win(board).class != Array
    else
      false
    end
  end

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

  def move(board, index, token = 'X')
    board[index] = token
  end

  def current_player(board)
    count_move(board).even? ? 'X' : 'O'
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
end
