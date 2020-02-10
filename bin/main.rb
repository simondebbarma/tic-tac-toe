# !/usr/bin/env ruby
require_relative '../lib/helper.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/logic.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'

class TicTacToe
  extend Helper
  include MenuHelper
  attr_accessor :board

  def initialize(board = [1, 2, 3, 4, 5, 6, 7, 8, 9])
    @board = board
  end

  def show_board
    welcome_message
    table(board)
  end

  def collecte_one_info
    player = Player.new
    player_one_info(player)
  end

  # puts 'Player 2 - please enter your name'
  # @player_two = gets.chomp

  # if validate_name(@player_two)

  # else
  #   puts 'Sorry! Invalid name. Try again.'
  #   puts 'Player 2 - please enter your name: '
  #   @player_two = gets.chomp
  #   if validate_name(@player_two)
  #     puts 'Okay, good name!'
  #   else
  #     puts "Your name is invalid again. We'll just call you 'Player 2'"
  #     @player_two = 'Player 2'.freeze
  #   end
  # end
  # puts ''

  # puts "#{@player_one} you will play as X"
  # puts "#{@player_two} you are gonna be O"
  # puts ''

  # show_board
  # puts ''
end

run = TicTacToe.new
run.show_board
run.collecte_one_info
# TicTacToe.show_board
# runtime = Logic.new
# runtime.play(b.board)

# play(board, player_one, player_two, menu)
