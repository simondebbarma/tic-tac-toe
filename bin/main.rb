# !/usr/bin/env ruby

board = %w[1 2 3 4 5 6 7 8 9]
WIN_POSSIBILITY = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
].freeze
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

puts "#{player_one} your default token is X"
puts "#{player_two} your default token is O"
puts ''

display_board(board)
puts ''

puts "Here\'s the board. #{player_one} goes first."

def convert_input(input)
  input.to_i - 1
end

def postion_taken(board, index)
  if board[index] == '^[1-9]'
    false
  elsif board[index] == 'X'
    true
  elsif board[index] == 'O'
    true

  end
end

def valid_move(board, index)
  if !index.between?(0, 8)
    false
  elsif postion_taken(board, index)
    false
  else
    true
  end
end

def win(board)
  WIN_POSSIBILITY.each do |win_pos|
    win_pos_one = win_pos[0]
    win_pos_two = win_pos[1]
    win_pos_three = win_pos[2]

    pos_one = board[win_pos_one]
    pos_two = board[win_pos_two]
    pos_three = board[win_pos_three]

    if pos_one == 'X' && pos_two == 'X' && pos_three == 'X' || pos_one == 'O' && pos_two == 'O' && pos_three == 'O'
      return win_pos
    end
  end
  false
end

def play(board)
  turn(board) until game_end(board)
  winner(board)
end

def board_full(board)
  board.all? do |item|
    if item == 'X'
    elsif item == 'X'
    end
  end
end

def game_end(board)
  win(board) || draw(board)
end

def winner(board)
  puts ''
  if current_player(board) == 'X'
    puts "#{player_two} is the winner!"
  else
    puts "#{player_one} is the winner!"
  end
end

def draw(board)
  if board_full(board)
    
    puts 'No more move game draw'
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
    puts 'Enter the location you want to mark. Use your num pad.'
    input = gets.chomp
    input = convert_input(input)
    is_valid_move = valid_move(board, input)
  end

  move(board, input, current_player(board))
  display_board(board)
end

def current_player(board)
  count_move(board).even? ? 'X' : 'O'
end

def count_move(board)
  counter = 0
  board.each do |b|
    if b == 'X'
      counter += 1
    elsif b == 'O'
      counter += 1
    end
  end
  counter
end

play(board)
