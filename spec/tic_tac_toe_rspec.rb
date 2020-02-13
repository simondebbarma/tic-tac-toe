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
    def capture_output
      old_stdout = $stdout
      $stdout = StringIO.new('', 'w')
      yield
      $stdout.string
    ensure
      $stdout = old_stdout
    end

    let(:output) { capture_output { tictactoe.show_board } }
    it 'print the board for the player' do
      tictactoe.instance_variable_set(:@board, board)
      expect(output).to include(' X | X | X')
      expect(output).to include('-----------')
      expect(output).to include(' O | X | O')
      expect(output).to include('-----------')
      expect(output).to include(' X | O | X')
    end
  end

  # describe 'Play Game' do
  #   let(:tictactoe) { TicTacToe.new }
  #   let(:players) { Player.new('Certil', 'Simon') }
  #   def run_bin(file)
  #     eval(File.read(file), binding)
  #   end
  #   it ' It create new Instace of tictatoe An play the game' do
  #     allow($stdout).to receive(:puts)

  #     expect(TicTacToe).to receive(:new).and_return(tictactoe)
  #     expect(tictactoe).to receive(:play).with(players.username_one, players.username_two)
  #     run_bin('./bin/main.rb')
  #   end
  # end

  describe ' Player turn' do
    let(:tictactoe) { TicTacToe.new }
    let(:players) { Player.new('Certil', 'Simon') }
    let(:board) { tictactoe.instance_variable_get(:@board) }
    it 'receives user input via the gets method' do
      allow($stdout).to receive(:puts)
      expect(tictactoe).to receive(:gets).and_return('1')
      tictactoe.turn(board, players.username_one, players.username_two)
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

  describe 'Game Draw' do
    let(:tictactoe) { TicTacToe.new }
    let(:players) { Player.new('Certil', 'Simon') }
    let(:emptyboard) {tictactoe.instance_variable_get(:@board)}

      it 'is is not a draw' do
        expect(tictactoe.game.draw(emptyboard)).to eq(false)
      end

    let(:boardfull) { %w[X O X O X X O X O] }
    let(:board) {tictactoe.instance_variable_set(:@board, boardfull)}

      it 'It is a draw' do
        expect(tictactoe.game.draw(board)).to eq(true)
      end
  end

  describe 'Available Slots' do
    let(:tictactoe) { TicTacToe.new }
    let(:logic) { Logic.new }
    let(:players) { Player.new('Certil', 'Simon') }
    let(:boardthree) { %w[X X 3 O X O X O X] }
    let(:board) {tictactoe.instance_variable_set(:@board, boardthree)}

    it 'Position 3 is available' do
      p logic.available_slots(board, players.username_one, players.username_two)
      expect(logic.available_slots(board, players.username_one, players.username_two)).to eq('3 ')
    end
  end
end
