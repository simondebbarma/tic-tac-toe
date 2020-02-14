require_relative './input_validator_helper.rb'
require 'colorize'
require 'whirly'

module MenuHelper
  include ValidatorHelper
  def table(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]}".colorize(:blue)
    puts '-----------'
    puts " #{board[3]} | #{board[4]} | #{board[5]}".colorize(:blue)
    puts '-----------'
    puts " #{board[6]} | #{board[7]} | #{board[8]}".colorize(:blue)
  end

  def welcome_message
    puts 'Welcome to Tic-Tac-Toe!'.colorize(:blue)
  end

  def player_one_info(player)
    welcome_message
    puts 'Player 1 - Please enter your name:'
    player.username_one = gets.chomp

    if validate_name(player.username_one)

    else
      puts 'Sorry! Invalid name. Try again.'.colorize(:red)
      puts 'Player 1 - please enter your name: '
      player.username_one = gets.chomp
      if validate_name(player.username_one)
        puts 'Okay, good name!'.colorize(:yellow)
      else
        puts "Your name is invalid again. We'll just call you 'Player 1'".colorize(:red)
        player.username_one = 'Player 1'
      end
    end
    puts `clear`
  end

  def player_two_info(player)
    puts 'Player 2 - Please enter your name:'
    player.username_two = gets.chomp

    if validate_name(player.username_two)
    else
      puts 'Sorry! Invalid name. Try again.'.colorize(:red)
      puts 'Player 2 - please enter your name: '
      player.username_two = gets.chomp
      if validate_name(player.username_two)
        puts 'Okay, good name!'.colorize(:yellow)
      else
        puts "Your name is invalid again. We'll just call you 'Player 1'".colorize(:red)
        player.username_two = 'Player 2'
      end
    end
    puts `clear`
  end

  def notice(players)
    puts "#{players.username_one} you will play as X".colorize(:yellow)
    puts "#{players.username_two} you are gonna be O".colorize(:yellow)
  end
end
