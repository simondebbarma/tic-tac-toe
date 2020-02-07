# !/usr/bin/env ruby

board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
def display_board(board)
  puts " #{board[0]}| #{board[1]} |#{board[2]}"
  puts '---------'
  puts " #{board[3]}| #{board[4]} |#{board[5]}"
  puts '---------'
  puts " #{board[6]}| #{board[7]} |#{board[8]}"
end

def validate_name(name)
  if name == '' || name == ' '
    false
  else
    true
  end
end

display_board(board)

puts 'Welcome to Tic-Tac-Toe!'
puts 'Player 1 - Please enter your name:'
player_1 = gets.chomp

if validate_name(player_1)
  puts 'Valid name.'
else
  puts 'Sorry! Invalid name. Try again.'
  puts 'Player 1 - please enter your name: '
  player_1 = gets.chomp
  if validate_name(player_1)
    puts 'Okay, good name!'
  else
    puts "Your name is invalid again. We'll just call you 'Player 1'"
    player_1 = 'Player 1'
  end
end

puts ''

puts 'Player 2 - please enter your name'
player_2 = gets.chomp

if validate_name(player_2)
  puts 'Valid name.'
else
  puts 'Sorry! Invalid name. Try again.'
  puts 'Player 2 - please enter your name: '
  player_2 = gets.chomp
  if validate_name(player_2)
    puts 'Okay, good name!'
  else
    puts "Your name is invalid again. We'll just call you 'Player 2'"
    player_2 = 'Player 2'
  end
end

def convert_input(input)
  input.to_i - 1
end

def postion_taken(board, input); end

def valid_move(_board, index)
  if !index.between?(0, 8)
    false
  elsif postion_taken(index)
    false
  else
    true
  end
end

def turn; end

def move(board, index, token = 'X')
  position = convert_input(index)
  board[position] = token
end

puts "#{player_1} your default token is X "
puts "#{player_2} your default token is O"
puts "#{player_1} chose a number from 1 to 9 to position your Token"
index = gets.chomp
move(board, index)
display_board(board)

# Ask player for move and print that on screen.
