require_relative '../lib/player.rb'
require_relative '../bin/main.rb'
require_relative '../lib/input_validator_helper.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/game.rb'

describe TicTacToe do
  describe 'Tchek if the board exist' do
    let(:tictactoe) { TicTacToe.new }
    it ' Create an instance variable of the board for the game with element from 1 to 9' do
      expect(tictactoe.instance_variable_get(:@board)).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe 'Tchek if the players exis' do
    let(:players) { Player.new('Certil', 'Simon') }
    it ' Create 2 player an asign a username for each' do
      expect(players.username_one).to eq('Certil')
      expect(players.username_two).to eq('Simon')
    end
    let(:players_two) { Player.new }
    it ' Create 2 player With no Argument and return nil for their username' do
      expect(players_two.username_one).to eq(nil)
      expect(players_two.username_two).to eq(nil)
    end

    it ' Rais an argument error if more than two argument given' do
      expect { Player.new('Certil', 'Simon', 'Remy') }.to raise_error(ArgumentError)
    end
  end

  describe '#validate_name' do
    include ValidatorHelper
    let(:validname) { 'Simon' }
    let(:invalidspace) { ' ' }
    let(:invalidempty) { '' }

    it 'player name is valid' do
      expect(validate_name(validname)).to eq(true)
    end

    it 'player name is invalid, space given' do
      expect(validate_name(invalidspace)).to eq(false)
    end

    it 'player name is invalid, empty string given' do
      expect(validate_name(invalidempty)).to eq(false)
    end
  end

  describe 'Display the board' do
    let(:board) { %w[X X X O X O X O X] }
    let(:tictactoe) { TicTacToe.new }

    let(:output) { capture_output { tictactoe.show_board } }
    it 'print the board for the player without an argument' do
      tictactoe.instance_variable_set(:@board, board)
      expect(output).to include(' X | X | X')
      expect(output).to include('-----------')
      expect(output).to include(' O | X | O')
      expect(output).to include('-----------')
      expect(output).to include(' X | O | X')
    end
    it 'It rais an error if a board given as argument' do
      expect { tictactoe.show_board(board) }.to raise_error(ArgumentError)
    end
  end

  describe '#CurrentPlayer' do
    let(:board) { %w[O 2 3 4 X 6 7 8 9] }
    let(:tictactoe) { TicTacToe.new }
    let(:players) { Player.new('Certil', 'Simon') }
    it "Return the current Player's token" do
      tictactoe.instance_variable_set(:@board, board)
      expect(tictactoe.game.current_player(tictactoe.instance_variable_get(:@board))).to eq('X')
    end
    it 'It rais an error if no board given as argument' do
      expect { tictactoe.game.current_player }.to raise_error(ArgumentError)
    end
  end

  describe '#Convert_input' do
    include ValidatorHelper
    let(:tictactoe) { TicTacToe.new }
    it "accepts the user's input (a string) as an argument rais errorif no argument" do
      expect { tictactoe.convert_input }.to raise_error(ArgumentError)
    end

    it "converts the user's input (a string) into an integer" do
      expect(tictactoe.convert_input('1')).to be_an(Integer)
    end

    it "converts the user's input from the user-friendly format (on a 1-9 scale) to the array-friendly format" do
      expect(tictactoe.convert_input('1')).to eq(0)
      expect(tictactoe.convert_input('5')).to eq(4)
    end
  end

  describe '#move' do
    let(:tictactoe) { TicTacToe.new }
    let(:board) { tictactoe.instance_variable_get(:@board) }
    it 'allows "X" player in the top left and "O" in the middle' do
      tictactoe.game.move(board, 0, 'X')
      tictactoe.game.move(board, 4, 'O')
      expect(board).to eq(['X', 2, 3, 4, 'O', 6, 7, 8, 9])
    end
    it 'It rais an error if no board given' do
      expect { tictactoe.game.move('X') }.to raise_error(ArgumentError)
    end
  end

  describe '#valid_move?' do
    let(:tictactoe) { TicTacToe.new }
    let(:board) { tictactoe.instance_variable_get(:@board) }
    it 'returns true/false based on whether the position is already occupied' do
      expect(tictactoe.game.logic.valid_move(board, 0)).to be_truthy
    end
    it 'checks that the attempted move is within the bounds of the tictactoe board' do
      expect(tictactoe.game.logic.valid_move(board, 44)).to be_falsey
    end
  end

  describe '#position_taken' do
    let(:game) { Game.new }
    let(:board) { %w[X 2 3 4 5 6 7 8 O] }
    it 'returns true if the position on the board is already occupied' do
      expect(game.logic.position_taken(board, 0)).to be_truthy
    end
    it 'returns false if the position on the board is already occupied' do
      expect(game.logic.position_taken(board, 1)).to be_falsey
    end
  end

  describe '#Play' do
    let(:tictactoe) { TicTacToe.new }
    let(:players) { Player.new('Certil', 'Simon') }

    it ' Play the entire game' do
      allow($stdout).to receive(:puts)
      expect(tictactoe).to receive(:gets).and_return('1')
      expect(tictactoe).to receive(:gets).and_return('2')
      expect(tictactoe).to receive(:gets).and_return('3')
      expect(tictactoe).to receive(:gets).and_return('4')
      expect(tictactoe).to receive(:gets).and_return('5')
      expect(tictactoe).to receive(:gets).and_return('6')
      expect(tictactoe).to receive(:gets).and_return('7')

      expect($stdout).to receive(:puts).with("#{players.username_one} is the winner")
      tictactoe.play(players.username_one, players.username_two)
    end
  end

  describe '#Turn' do
    let(:tictactoe) { TicTacToe.new }
    let(:players) { Player.new('Certil', 'Simon') }
    let(:board) { tictactoe.instance_variable_get(:@board) }
    it 'receives user input via the gets method' do
      allow($stdout).to receive(:puts)
      expect(tictactoe).to receive(:gets).and_return('1')
      tictactoe.turn(board, players.username_one, players.username_two)
    end
  end

  describe '#Count_move' do
    let(:tictactoe) { TicTacToe.new }
    let(:board) { %w[O 2 3 4 X 6 7 8 X] }
    it 'Count occupied position' do
      tictactoe.instance_variable_set(:@board, board)
      expect(tictactoe.game.count_move(tictactoe.instance_variable_get(:@board))).to eq(3)
    end
  end

  describe '#game_end' do
    let(:board) { %w[X X X O X O X O X] }
    let(:tictactoe) { TicTacToe.new }
    it 'return true if the game end' do
      expect(tictactoe.game.game_end(board)).to be_truthy
    end
  end

  describe '#Win ' do
    let(:tictactoe) { TicTacToe.new }
    let(:board) { %w[X O X O X X O X O] }
    it 'Return false for a draw' do
      tictactoe.instance_variable_set(:@board, board)
      expect(tictactoe.game.win(tictactoe.instance_variable_get(:@board))).to be_falsey
    end
    let(:win_board) { %w[X O X O X O O X X] }
    it 'Return true for a win an display the winning position' do
      tictactoe.instance_variable_set(:@board, win_board)
      expect(tictactoe.game.win(tictactoe.instance_variable_get(:@board))).to contain_exactly(0, 4, 8)
    end
  end

  describe '#Winner' do
    let(:tictactoe) { TicTacToe.new }
    let(:players) { Player.new('Certil', 'Simon') }
    let(:moves) { %w[X X X O O 6 7 8 8] }
    it 'congratulates the winner X if his move win' do
      tictactoe.instance_variable_set(:@board, moves)
      expect($stdout).to receive(:puts).with("#{players.username_one} is the winner")
      tictactoe.play(players.username_one, players.username_two)
    end
  end

  describe '#Draw' do
    let(:tictactoe) { TicTacToe.new }
    let(:players) { Player.new('Certil', 'Simon') }
    let(:emptyboard) { tictactoe.instance_variable_get(:@board) }

    it 'is is not a draw' do
      expect(tictactoe.game.draw(emptyboard)).to eq(false)
    end

    let(:boardfull) { %w[X O X O X X O X O] }
    let(:board) { tictactoe.instance_variable_set(:@board, boardfull) }

    it 'It is a draw' do
      expect(tictactoe.game.draw(board)).to eq(true)
    end
  end

  describe '#board_full' do
    let(:tictactoe) { TicTacToe.new }
    it 'returns true for a draw' do
      board = %w[X O X O X X O X O]
      tictactoe.instance_variable_set(:@board, board)

      expect(tictactoe.game.logic.board_full(board)).to be_truthy
    end

    it 'returns false for an in-progress Tictacto' do
      board = %w[X 9 X O 9 X 9 X O]
      tictactoe.instance_variable_set(:@board, board)

      expect(tictactoe.game.logic.board_full(board)).to be_falsey
    end
  end
end
