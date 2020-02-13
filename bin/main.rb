# !/usr/bin/env ruby
require_relative '../lib/input_validator_helper.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
require 'colorize'

class TicTacToe
  extend ValidatorHelper
  include MenuHelper
  attr_accessor :board

  def initialize(board = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @board = board
  end

  def show_board
    puts ''
    table(board)
  end

  def game
    @game = Game.new
  end

  def collect_info(player)
    player_one_info(player)
    player_two_info(player)
    notice(player)
  end

  def play(player_one, player_two)
    turn(board, player_one, player_two) until game.game_end(board)

    if game.winner(board) == 'X'
      custom_message_one(player_one, player_two)
    elsif game.winner(board) == 'O'
      custom_message_two(player_one, player_two)
    else
      puts 'It a Draw!'.colorize(:yellow)
      end_message(player_one, player_two)
    end
  end

  def turn(board, player_one, player_two)
    is_valid_move = false
    until is_valid_move == true
      game.logic.available_slots(board, player_one, player_two)
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
    puts `clear`
    show_board
    puts ''
  end
end
#run = TicTacToe.new
#players = Player.new
#run.collect_info(players)
#player_one = players.username_one
#player_two = players.username_two
#run.show_board
#run.play(player_one, player_two)
