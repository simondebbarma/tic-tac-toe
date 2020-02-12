require_relative '../lib/player.rb'
require_relative '../bin/main.rb'
require_relative '../lib/input_validator_helper.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/game.rb'

RSpec.describe TicTacToe do
  describe '#initialize' do
    it ' Create an instance variable for the game with element from 1 to 9' do
      tictactoe = TicTacToe.new
      expect(tictactoe.instance_variable_get(:@board)).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end
end
