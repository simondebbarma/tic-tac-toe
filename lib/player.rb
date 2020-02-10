class Player
    attr_accessor :board
    
    def current_player(board)
        count_move(board).even? ? 'X' : 'O'
    end
end