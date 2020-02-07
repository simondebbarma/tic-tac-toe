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
    if name == "" || name == " "
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
  puts "Valid name."
else
  puts "Sorry! Invalid name. Try again."
  puts 'Player 1 - please enter your name: '
  player_1 = gets.chomp
   if validate_name(player_1)
     puts "Okay, good name!"
   else
    puts "Your name is invalid again. We'll just call you 'Player 1'"
    player_1 = "Player 1"
   end
end

puts ""

puts 'Player 2 - please enter your name'
player_2 = gets.chomp

if validate_name(player_2)
  puts "Valid name."
else
  puts "Sorry! Invalid name. Try again."
  puts 'Player 2 - please enter your name: '
  player_2 = gets.chomp
    if validate_name(player_2)
        puts "Okay, good name!"
    else
    puts "Your name is invalid again. We'll just call you 'Player 2'"
    player_2 = "Player 2"
    end
end

# Ask player for move and print that on screen.