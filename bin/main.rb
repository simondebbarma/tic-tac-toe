# !/usr/bin/env ruby

board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]}"
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]}"
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]}"
end

def validate_name(name)
  if name == ''
    false
  else
    name != ' '
  end
end

display_board(board)

puts 'Welcome to Tic-Tac-Toe!'
puts 'Player 1 - Please enter your name:'
player_one = gets.chomp

if validate_name(player_one)
  puts 'Valid name.'
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
  puts 'Valid name.'
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

def convert_input(input)
  input.to_i - 1
end

def move(board, index, token = 'X')
  position = convert_input(index)
  board[position] = token
end

puts ''

puts "#{player_one} your default token is X"
puts "#{player_two} your default token is O"

puts ''

puts "#{player_one} chose a number from 1 to 9 to position your Token"
index = gets.chomp
move(board, index)

puts ''

display_board(board)
