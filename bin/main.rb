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
    welcome_message
    table(board)
  end

  def collecte_info(player)
    player_one_info(player)
    player_two_info(player)
    notice(player)
  end

  def play(board, player_name_one = nil, player_name_two = nil, menu = nil)
    turn(board, menu) until Game.game_end(board)

    if winner(board) == 'X'
      puts "#{player_name_one} is the winner"
    elsif winner(board) == 'O'
      puts "#{player_name_two} is the winner"

    else
      puts 'It a Draw!'
    end

  end
end
players = Player.new
player_one = players.username_one
player_two = players.username_one
run = TicTacToe.new
run.show_board
run.collecte_info(players)
run.play(player_one, player_two)
# TicTacToe.show_board
# runtime = Logic.new
# runtime.play(b.board)

# play(board, player_one, player_two, menu)
