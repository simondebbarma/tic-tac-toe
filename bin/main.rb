# !/usr/bin/env ruby

board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
WIN_POSSIBILITY = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
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

def postion_taken(board, index) 
   if board[index] == " " 
     false
    elsif board[index]== "X"
        true
    elsif board[index]=="O"
       true

   end

end

def valid_move(board, index)
  if !index.between?(0, 8)
    false
  elsif postion_taken(board,index)
    false
  else
    true
  end
end

def win(board) 
  WIN_POSSIBILITY.each do   |win_pos|
    win_po_1 = win_pos[0]
    win_po_2 = win_pos[1]
    win_po_3 = win_pos[2]

    position_1 = board[win_po_1]
    position_2 = board[win_po_2]
    position_3 = board[win_po_3]

    if (position_1 == "X" && position_2 =="X" && position_3 =="X" || position_1 == "O" && position_2 =="O" && position_3 == "O")
      return win_pos
    end

  end
  return false
end

def play(board)
   until game_end(board)
    turn(board)
   end

  #to do ask user to play again!
end

def board_full(board)
  return board.all?{|item| item == "X" || item =="O"}
end

def game_end(board)
  win(board) || draw(board)
end

def winner 
 #to do determin the winner
end

def draw(board)
 if board_full(board)
    (win(board).class == Array)?false:true
   puts 'No more move game draw'
   #to do display the winner
 else
  false
 end
end



def move(board, index, token = 'X')
    board[index] = token
end

def turn(board)
  is_valid_move = false
  until is_valid_move == true
   puts 'please enter a number between 1, 9'
   input = gets.chomp
   input = convert_input(input)
   is_valid_move = valid_move(board,input)
  end
  
  move(board, input, current_player(board))
  display_board(board)
end

def current_player(board)
 coun_move(board)%2 == 0?"X":"O"
end

def coun_move(board)
counter = 0
board.each do  |b| 
  if (b =="X" || b =="O")
    counter += 1 
  end
end
return counter
end

puts ''

puts "#{player_one} your default token is X"
puts "#{player_two} your default token is O"

puts ''


puts "#{player_one}"
play(board)
puts ''

