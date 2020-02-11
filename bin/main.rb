# !/usr/bin/env ruby
require_relative '../lib/helper.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/logic.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

class TicTacToe
  extend ValidatorHelper
  include MenuHelper
  attr_accessor :board

  def initialize(board = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @board = board
  end

  def show_board
    table(board)
  end

  def game
    @game = Game.new
  end

  def players
    @player = Player.new
  end

  def collecte_info(player)
    player_one_info(player)
    player_two_info(player)
    notice(player)
  end

  def play(player_one, player_two, menu = nil)
    turn(board, menu) until game.game_end(board)

    if game.winner(board) == 'X'
      puts "#{player_one} is the winner"
    elsif winner(board) == 'O'
      puts "#{player_two} is the winner"

    else
      puts 'It a Draw!'
    end
  end

  def turn(board, _menu = nil)
    is_valid_move = false
    until is_valid_move == true
      game.logic.available_slots(board)
      puts ''
      puts 'Make a move. Select one the above slots.'
      puts ''
      input = gets.chomp
      input = convert_input(input)
      is_valid_move = game.logic.valid_move(board, input)
      puts ''
      puts '-----------------------------------------'
      puts ''
    end

    game.move(board, input, game.current_player(board))
    show_board
    puts ''
  end
end
players = Player.new
player_one = players.username_one
player_two = players.username_one
run = TicTacToe.new
run.collecte_info(players)
run.show_board
run.play(player_one, player_two)
