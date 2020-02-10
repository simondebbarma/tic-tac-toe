# !/usr/bin/env ruby
require_relative '../lib/helper.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/logic.rb'
require_relative '../lib/game.rb'
require_relative '../lib/player.rb'
include Helper

class TicTacToe
  board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  menu = Menu.new
  menu.display_board(board)

  puts 'Welcome to Tic-Tac-Toe!'
  puts 'Player 1 - Please enter your name:'
  player_one = gets.chomp

  if validate_name(player_one)

  else
    puts 'Sorry! Invalid name. Try again.'
    puts 'Player 1 - please enter your name: '
    player_one = gets.chomp
    if validate_name(player_one)
      puts 'Okay, good name!'
    else
      puts "Your name is invalid again. We'll just call you 'Player 1'"
      player_one = 'Player 1'.freeze
    end
  end
  puts ''

  puts 'Player 2 - please enter your name'
  player_two = gets.chomp

  if validate_name(player_two)

  else
    puts 'Sorry! Invalid name. Try again.'
    puts 'Player 2 - please enter your name: '
    player_two = gets.chomp
    if validate_name(player_two)
      puts 'Okay, good name!'
    else
      puts "Your name is invalid again. We'll just call you 'Player 2'"
      player_two = 'Player 2'.freeze
    end
  end
  puts ''

  puts "#{player_one} you will play as X"
  puts "#{player_two} you are gonna be O"
  puts ''

  menu.display_board(board)
  puts ''
end

play(board, player_one, player_two, menu)
