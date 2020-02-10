class Player
  attr_accessor :username_one, :username_two

  def initialize(username_one = nil, username_two = nil)
    username_one = username_one
    username_two = username_two
  end

  def current_player(board)
    count_move(board).even? ? 'X' : 'O'
  end
end
