# !/usr/bin/env ruby

puts 'hello, world'

puts 'Welcome to Tic-tac-toe player 1 please enter your name'
board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
def display_board(board)
  puts " #{board[0]}| #{board[1]} |#{board[2]}"
  puts '---------'
  puts " #{board[3]}| #{board[4]} |#{board[5]}"
  puts '---------'
  puts " #{board[6]}| #{board[7]} |#{board[8]}"
end

display_board(board)
player_1 = gets.chomp

def valide_name(name)
  return true unless name != '' || ' '
  end

if valide_name(player_1)
  puts ' player 1 please enter your name'
  player_2 = gets.chomp

else
  puts 'Welcome to Tic-tac-toe player 1 please enter your name'
  player_1 = gets.chomp

end

# validate name if its empty or not valid re-ask for user input
